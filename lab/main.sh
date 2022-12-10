#!/bin/bash

#Color Format
default=`echo -en "\e[39m"`
red=`echo -en "\e[31m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`

bold=`echo -en "\e[1m"`
normal=`echo -en "\e[0m"`

function logo(){
    
    echo "    "
    echo "██████╗░███╗░░░███╗██╗"
    echo "██╔══██╗████╗░████║██║"
    echo "██████╦╝██╔████╔██║██║"
    echo "██╔══██╗██║╚██╔╝██║██║"
    echo "██████╦╝██║░╚═╝░██║██║"
    echo "╚═════╝░╚═╝░░░░░╚═╝╚═╝"
    echo -e "\e[1;36m--- Team Alpha ----\e[0m"
    echo ""
    echo ""
}


function cowLogo(){
    echo "$red   ⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo "⠀⠸⣿⣯⡓⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo "⡤⠊⠉⠿⠈⠉⠑⠲⠤⠤⠤⠤⠤⠤⠤⢤⣤⠤⠤⠶⠖⠚⠛⠓⢦⠀⠀"
    echo "⠧⣤⣀⣀⣀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⢸⢸⠇⠀"
    echo "⠀⠀⠈⠉⠙⢄⢠⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠆⠀⠀⠀⠀⠀⠸⢸⠀⠀"
    echo "⠀⠀⠀⠀⠀⠈⣆⠢⡀⠀⠐⡀⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⡄⣾⠀⠀"
    echo "⠀⠀⠀⠀⠀⠀⠘⢦⡘⣄⠀⣇⠀⠀⠀⠀⠀⢀⢳⡖⠲⢄⣸⢧⢻⡄⠀"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⠀⠘⠟⠒⠦⠤⠐⢧⡞⢛⡳⠚⢻⢏⠀⠙⡆"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⢸⠉⣧⠀⡀⠀⠀⠀⠀⠀⠑⢻⡇⢠⠞⠀⠣⠀⡇"
    echo "⠀⠀⠀⠀⠀⠀⠀⣠⣏⣠⣿⠀⣣⠀⠀⠀⠀⠀⢀⡞⠀⡎⠀⠀⡄⠀⡇"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠷⠶⠇⠀⠀⠀⠀⣰⣏⣀⡴⠃⠀⣴⣥⣴⠋"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠀"
    echo "--- Animal Weight Calculator ---$default"
}


function calculate(){
    
    read -p "Enter Height (cm): " height
    read -p "Enter Weight (kg): " weight
    read -p "Enter Gender (m/f): " gender
    
    heightm=$[$height ** 2]
    y=`echo "scale=2; $heightm / 10000" | bc -l`
    
    BMI=`echo "scale=2; $weight / $y" | bc -l`
    
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
}


function calculateWeight(){
    
    cowLogo
    
    read -p "Enter Length from front leg to back leg (in): " lValue
    read -p "Enter Length from front leg to back leg (in): " gValue
    
    
    gVTotal=$[$gValue ** 2]
    weightAnimal=`echo "scale=2; $gVTotal * $lValue " | bc -l`
    
    totalWeight=`echo "scale=2; $weightAnimal / 660 " | bc -l`
    
    echo -e "\e[1;44m Total Weight of Animal: $totalWeight \e[0m"
    
}

function currentWeather(){
    
    
    my_weather_api="2afec2db7666aacfcc87650321550e5b"
    dhaka_lat="23.8103"
    dhaka_lon="90.4125"
    url="https://api.openweathermap.org/data/2.5/weather?lat=$dhaka_lat&lon=$dhaka_lon&appid=$my_weather_api"
    json="$(wget -qO- "$url")"
    
    #Color Format
    default=`echo -en "\e[39m"`
    red=`echo -en "\e[31m"`
    orange=`echo -en "\e[33m"`
    blue=`echo -en "\e[34m"`
    
    bold=`echo -en "\e[1m"`
    normal=`echo -en "\e[0m"`
    
    country=$(echo $json|jq -r ."sys|.country")
    sunR=$(echo $json|jq -r ."sys|.sunrise")
    sunS=$(echo $json|jq -r ."sys|.sunset")
    temp=$(echo $json|jq -r ."main|.temp")
    temp_min=$(echo $json|jq -r ."main|.temp_min")
    temp_max=$(echo $json|jq -r ."main|.temp_max")
    humidity=$(echo $json|jq -r ."main|.humidity")
    description=$(echo $json|jq -r ."weather[0]|.description")
    
    if [[ ${temp} > 90 ]]
    then
        color=${red}
    elif [[ ${temp} > 75 ]]
    then
        color=${orange}
    elif [[ ${temp} < 50 ]]
    then
        color=${blue}
    else
        color=""
    fi
    
    echo ""
    echo "----------------------------------"
    echo "           Weather Info           "
    echo "----------------------------------"
    echo "It is currently ${bold}${description}${normal}"
    echo "${color}Temperature: ${temp}℉ ${default}"
    echo "${color}Range: ${temp_min}℉ - ${temp_max}℉ ${default}"
    echo "Humidity: ${humidity}%"
    echo "Country: ${country}"
    echo "${orange}Sunrise: ${sunR}${default}"
    echo "${red}Sunset: ${sunS}${default}"
}

while true
do
    echo ""
    echo "Menu"
    echo "1. BMI Calculator"
    echo "2. Animal Weight Calculator"
    echo "3. Weather"
    echo "$red 4. Exit $default"
    read -p "Select Your Option: " op
    
    if [ $op -eq 1 ];
    then logo
        calculate
    elif [ $op -eq 2 ];
    then calculateWeight
    elif [ $op -eq 3 ];
    then currentWeather
    elif [ $op -eq 4 ];
    then break
    else echo " $red Select right option. $default"
    fi
    
done