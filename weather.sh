#!/bin/bash

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

echo "It is currently ${bold}${description}${normal}"
echo "${color}Temperature: ${temp}℉ ${default}"
echo "${color}Range: ${temp_min}℉ - ${temp_max}℉ ${default}"
echo "Humidity: ${humidity}%"
echo "Country: ${country}"
echo "${orange}Sunrise: ${sunR}${default}"
echo "${red}Sunset: ${sunS}${default}"