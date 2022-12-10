#!/bin/bash

function calculateWeight(){
    
    local lValue="$1"
    local gValue="$2"
    
    gVTotal=$[$gValue ** 2]
    weightAnimal=`echo "scale=2; $gVTotal * $lValue " | bc -l`
    
    totalWeight=`echo "scale=2; $weightAnimal / 660 " | bc -l`
    
    echo "Total Weight of Animal: $totalWeight Kg"
    
}

read -p "Enter Length from front leg to back leg (in): " l
read -p "Enter Length from front leg to back leg (in): " g

calculateWeight $l $g


