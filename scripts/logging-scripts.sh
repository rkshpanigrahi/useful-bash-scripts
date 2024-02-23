#!/bin/bash

# Log file
LOG_FILE="script.log"

# Function to log messages
log_message() {
    local level=$1
    local message=$2
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
    echo "[$timestamp] [$level] $message"
}

# Example usage
log_message "INFO" "Starting script execution"
log_message "ERROR" "Failed to open file: file.txt"
log_message "WARNING" "Disk space is running low"
