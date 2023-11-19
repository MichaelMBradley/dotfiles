#!/bin/env sh

# Honestly forget what this does, I don't think it's finished

window=$(xdotool getactivewindow getwindowgeometry)

pos=$(echo $window | awk '/Position: [0-9]+,[0-9]+ \(screen: [0-9]+\)/' | awk '{print $2 }')
posx=$(echo $pos | awk -F "," '{ print $1 }')
posy=$(echo $pos | awk -F "," '{ print $2 }')

geom=$(echo $window | awk '/Geometry: [0-9]+x[0-9]+/' | awk '{ print $2 }')
geomx=$(echo $geom | awk -F "x" '{ print $1 }')
geomy=$(echo $geom | awk -F "x" '{ print $2 }')

mousex=$(expr $posx + $geomx / 2)
mousey=$(expr $posy + $geomy / 2)

xdotool mousemove $mousex $mousey

