#!/bin/sh
killall rosmaster
killall roslaunch
pkill -9 python
sleep 0.5s
echo "ROS_IP: $ROS_IP"

WID=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}')
xdotool windowfocus $WID
xdotool key ctrl+shift+t
wmctrl -i -a $WID

sleep 2; xdotool type --delay 1 --clearmodifiers "roscore"; xdotool key Return;


WID=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}')
xdotool windowfocus $WID
xdotool key ctrl+shift+t
wmctrl -i -a $WID

sleep 1; xdotool type --delay 1 --clearmodifiers "roslaunch rosbridge_server rosbridge_websocket.launch"; xdotool key Return;

WID=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}')
xdotool windowfocus $WID
xdotool key ctrl+shift+t
wmctrl -i -a $WID

sleep 1; xdotool type --delay 1 --clearmodifiers "python src/twisted_server_ros.py"; xdotool key Return;