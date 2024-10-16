#!/bin/bash

# Function to print star pattern
print_star_pattern() {
    echo "Printing Star Pattern:"
    n=9  # Size of the pattern
    mid=$((n/2))
    
    # Upper part of star
    for ((i=0; i<n/2; i++))
    do
        # Print spaces
        for ((j=0; j<n/2-i; j++)); do echo -n " "; done
        
        # Print stars
        echo -n "*"
        
        # Print inner spaces
        for ((j=0; j<2*i-1; j++)); do echo -n " "; done
        
        # Print star for all rows except first
        if ((i != 0)); then echo -n "*"; fi
        echo
    done
    
    # Middle line of star
    for ((i=0; i<n; i++)); do echo -n "*"; done
    echo
    
    # Lower left diagonal
    for ((i=0; i<n/2; i++))
    do
        # Print spaces
        for ((j=0; j<i+1; j++)); do echo -n " "; done
        echo -n "*"
        
        # Print inner spaces
        for ((j=0; j<n-2*(i+2); j++)); do echo -n " "; done
        
        # Print star for all rows except last
        if ((i != n/2-1)); then echo -n "*"; fi
        echo
    done
}

# Function to print circle pattern
print_circle_pattern() {
    echo "Printing Circle Pattern:"
    r=5  # Radius of circle
    
    # Loop for upper and lower part
    for ((i=-r; i<=r; i++))
    do
        # Loop for left and right part
        for ((j=-r; j<=r; j++))
        do
            # Calculate distance from center
            dist=$(echo "sqrt($i*$i + $j*$j)" | bc -l)
            
            # Print * if point lies on or near circle
            if (( $(echo "$dist > $r-0.5 && $dist < $r+0.5" | bc -l) ))
            then
                echo -n "*"
            else
                echo -n " "
            fi
        done
        echo
    done
}

# Main execution
echo "1. Star Pattern:"
print_star_pattern
echo
echo "2. Circle Pattern:"
print_circle_pattern
