#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";

        # Icons for Font Awesome 5 Pro
        # 01d) icon="";;
        # 01n) icon="";;
        # 02d) icon="";;
        # 02n) icon="";;
        # 03d) icon="";;
        # 03n) icon="";;
        # 04*) icon="";;
        # 09*) icon="";;
        # 10d) icon="";;
        # 10n) icon="";;
        # 11*) icon="";;
        # 13*) icon="";;
        # 50*) icon="";;
        # *) icon="";
    esac

    echo $icon
}

get_duration() {

    osname=$(uname -s)

    case $osname in
        *BSD) date -r "$1" -u +%H:%M;;
        *) date --date="@$1" -u +%H:%M;;
    esac

}

KEY="6865df0d489817348e4c7941aaa6cdeb"
# CITY="Ann Arbor"
CITY="Los Angeles"
UNITS="imperial"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    current=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
    forecast=$(curl -sf "$API/forecast?appid=$KEY&$CITY_PARAM&units=$UNITS&cnt=1")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        current=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
        forecast=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS&cnt=1")
    fi
fi

if [ -n "$current" ] && [ -n "$forecast" ]; then
    current_temp=$(echo "$current" | jq ".main.temp" | cut -d "." -f 1)
    current_icon=$(echo "$current" | jq -r ".weather[0].icon")

    forecast_temp=$(echo "$forecast" | jq ".list[].main.temp" | cut -d "." -f 1)
    forecast_icon=$(echo "$forecast" | jq -r ".list[].weather[0].icon")


    if [ "$current_temp" -gt "$forecast_temp" ]; then
        trend=""
    elif [ "$forecast_temp" -gt "$current_temp" ]; then
        trend=""
    else
        trend=""
    fi


    sun_rise=$(echo "$current" | jq ".sys.sunrise")
    sun_set=$(echo "$current" | jq ".sys.sunset")
    now=$(date +%s)
    now2=$(date +%h-%d-%Y)
    #now2=$(date +%h/%d/%Y)
    #now2=$(date +%h/%d--%H:%m)
    now2_symbol=""

    if [ "$sun_rise" -gt "$now" ]; then
        daytime=" $(get_duration "$((sun_rise-now))")"
    elif [ "$sun_set" -gt "$now" ]; then
        daytime=" $(get_duration "$((sun_set-now))")"
    else
        daytime=" $(get_duration "$((sun_rise-now))")"
    fi

    # WITH TREND AND DAYTIME
    # echo "$(get_icon "$current_icon") $current_temp$SYMBOL  $trend  $(get_icon "$forecast_icon") $forecast_temp$SYMBOL   $daytime"
    # WITH TREND
    # echo "$(get_icon "$current_icon") $current_temp$SYMBOL  $trend  $(get_icon "$forecast_icon") $forecast_temp$SYMBOL"

    # ex color string
    # "%{F#e5c07b}xyz%{F- }"
    COLOR=""
    if [ "$current_temp" -lt 0 ]; then
        COLOR="%{F#1e88e5}"
    elif [ "$current_temp" -ge 0 ] && [ "$current_temp" -le 40 ]; then
        COLOR="%{F#55aebb}"
    elif [ "$current_temp" -gt 40 ] && [ "$current_temp" -le 80 ]; then
        COLOR="%{F#fc8353}"
    elif [ "$current_temp" -gt 80 ] && [ "$current_temp" -le 120 ]; then
        COLOR="%{F#d8524c}"
    fi
    echo "$COLOR$(get_icon "$current_icon") $current_temp$SYMBOL%{F- }"
    # echo "$(get_icon "$current_icon") $current_temp$SYMBOL $now2_symbol $now2"
    # echo "$(get_icon "$current_icon") $current_temp$SYMBOL"
fi
