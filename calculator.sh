#!/bin/bash

function calculate(){
    
    local height="$1"
    local weight="$2"
    local gender="$3"
    
    x=$weight
    heightm=$[$height ** 2]
    y=`echo "scale=2; $heightm / 10000" | bc -l`
    
    BMI=`echo "scale=2; $x / $y" | bc -l`
    
}

read -p "Enter Height (cm): " h
read -p "Enter Weight (kg): " w
read -p "Enter Gender (m/f): " g

calculate $h $w $g

echo "Your BMI is $BMI"


