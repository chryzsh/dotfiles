#!/bin/bash

#while true; do
alarm() {
  ( \speaker-test --frequency 400 --test sine )&
  pid=$!
  \sleep 0.${2}s
  \kill -9 $pid
}

while true; do
if grep -q RUNNING /proc/asound/card0/pcm0p/sub0/status 2>&1;then
    echo "playing"
else
    #echo "idle"
    vol=$(amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]')
    #echo $vol
    amixer set Master 10%
    #speaker-test -p 500000
    ( speaker-test -t sine -f 100 )& pid=$! ; sleep 0.2s ; kill -9 $pid
    amixer set Master $vol
fi
#sleep 1
sleep 15m
echo "complete"
done
exit
