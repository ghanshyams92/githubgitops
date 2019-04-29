#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1600x900x16 &
sleep 5
openbox-session&
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
cd /opt/noVNC && ln -s vnc_auto.html index.html && ./utils/launch.sh --vnc localhost:5900 &

/etc/init.d/node_exporter start &
/filebeat-6.2.1-linux-x86_64/filebeat -e -c /filebeat-6.2.1-linux-x86_64/filebeat.yml 
