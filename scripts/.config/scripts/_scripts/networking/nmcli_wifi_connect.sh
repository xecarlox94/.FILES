#!/bin/sh


nmcli dev wifi list | awk '{print $2}' #| tail -n +2 
  #uniq #|\
  #sort -u #|\
  #dmenu -l 20`
  #sed '/--/d' |\


exit


sudo nmcli dev wifi connect "$NETWORK"
#sudo nmcli --ask dev wifi connect "$NETWORK"

ping -c 3 google.com
