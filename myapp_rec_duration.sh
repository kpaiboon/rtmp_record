#!/bin/bash
echo "Hello World"
echo " Usage : ./myapp_rec_duration.sh 0866758044537963 4  "

my_id="0866758044537963"
my_ch="4"

default_id="$my_id"
default_ch="$my_ch"

ARGV_id=${1:-$default_id}   # or Default value
ARGV_ch=${2:-$default_ch}   # or Default value

echo "$ARGV_id"
echo "$ARGV_ch"

my_id="$ARGV_id"
my_ch="$ARGV_ch"

# Loop forever (until break is issued)
while true; do

conf_url="rtmp://67.203.13.26:26998/live/$my_id/$my_ch/2"

Now_time=$(date +%"H%M%S")
Now_date=$(date +%F)

conf_destdir="/home/user/mystorage/D$Now_date/$my_id"
conf_destimage="/home/user/mystorage/D$Now_date/$my_id/vid_$my_id-ch$my_ch--$Now_date--$Now_time.mp4"


echo $conf_url
echo $conf_destdir
echo $conf_destimage

echo "Wait for 2 seconds to start"
sleep 2

#brake exit()
#exit 1


mkdir -p $conf_destdir

ffmpeg -nostdin -y -i "$conf_url" -t 00:05:00 $conf_destimage

# .end Loop 
done
