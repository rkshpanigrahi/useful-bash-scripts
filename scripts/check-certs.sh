#!/usr/bin/env bash
#
# AUTHOR: Rakesh Panigrahi
# Command to check the certs in the keystore

KEYSTORE=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/cacerts
KEYSTORE_PW=<PWD>

current_epoch=$(date +%s)
ten_days_in_seconds=$((10 * 24 * 60 * 60))

while read -r ALIAS; do
    # ALIAS is in the form: "Alias name: <REST>". We want <REST>.
    ALIAS=$(echo ${ALIAS} | cut -d' ' -f3)

    # read the next line
    read -r UNTIL

    # UNTIL is in the form: "Valid from: ... until: <REST>". We want <REST>
    UNTIL=$(echo ${UNTIL} | sed 's/^.*until: //')

    # convert to epoch
    EPOCH=$(date -d "${UNTIL}" +%s)

    # calculate the difference between the expiration date and the current date
    expiration_diff=$((EPOCH - current_epoch))

   # compare with the current time
    if [ $EPOCH -lt $current_epoch ]; then
        echo "${ALIAS} -->  ${UNTIL} has expired."
     else
        # check if the certificate will expire in the next 10 days
        if [ $expiration_diff -le $ten_days_in_seconds ]; then
            echo "${ALIAS} -->  ${UNTIL} is expiring in less than 10 days." 
        else
            echo "${ALIAS} -->  ${UNTIL}"
        fi
    fi
    # do something with it
    # echo "${ALIAS}  -->  ${EPOCH}"
done < <(keytool -list -v -keystore "${KEYSTORE}" -storepass "${KEYSTORE_PW}" | grep -E '^Alias name:|^Valid from:')