#!/bin/bash


function logo(){
    
    echo "    "
    echo "██████╗░███╗░░░███╗██╗"
    echo "██╔══██╗████╗░████║██║"
    echo "██████╦╝██╔████╔██║██║"
    echo "██╔══██╗██║╚██╔╝██║██║"
    echo "██████╦╝██║░╚═╝░██║██║"
    echo "╚═════╝░╚═╝░░░░░╚═╝╚═╝"
    echo -e "\e[1;36m--- @JahidHasanCo ----\e[0m"
    echo ""
    echo ""
}

function calculate(){
    
    local height="$1"
    local weight="$2"
    local gender="$3"
    
    heightm=$[$height ** 2]
    y=`echo "scale=2; $heightm / 10000" | bc -l`
    
    BMI=`echo "scale=2; $weight / $y" | bc -l`
    
}

logo

read -p "Enter Height (cm): " h
read -p "Enter Weight (kg): " w
read -p "Enter Gender (m/f): " g

calculate $h $w $g

echo ""
echo -e "\e[1;44m Your BMI is $BMI \e[0m"

if [[ $BMI > 15.99 && $BMI < 18.50 ]]; then
    echo -e "\e[1;33mYou are underweight \e[0m"
    elif [[ $BMI > 18.99 && $BMI < 25.00 ]]; then
    echo -e "\e[1;32mYou are normal (healthy weight). \e[0m"
    elif [[ $BMI > 24.99 && $BMI < 30.00 ]]; then
    echo -e "\e[1;41mYou are overweight \e[0m"
    elif [[ $BMI > 29.99 && $BMI < 35.00 ]]; then
    echo -e "\e[1;41mYou are obese class I \e[0m"
    elif [[ $BMI > 34.99 && $BMI < 40.00 ]]; then
    echo -e "\e[1;41mYou are obese class II \e[0m"
else
    echo -e "\e[1;41m You are obese \e[0m"
fi

echo ""


