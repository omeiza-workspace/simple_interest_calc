#!/bin/bash

# Function to calculate simple interest
calculate_simple_interest() {
    principal=$1
    rate=$2
    time=$3
    
    # Calculate simple interest
    interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
    
    echo "The simple interest is: $interest"
}

# Prompt the user for input
echo "Enter the principal amount:"
read principal

echo "Enter the rate of interest (in percentage):"
read rate

echo "Enter the time period (in years):"
read time

# Validate input
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo "Error: All inputs are required."
    exit 1
fi

if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Please enter valid numbers for principal, rate, and time."
    exit 1
fi

# Call the function to calculate simple interest
calculate_simple_interest "$principal" "$rate" "$time"
