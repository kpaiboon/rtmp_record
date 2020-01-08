#!/bin/bash
echo "Hello World"

echo " Usage : ./myapp_rec.sh 0866758044537963 4  "

my_id="0866758044537963"
my_ch="4"

default_id="$my_id"
default_ch="$my_ch"

ARGV_id=${1:-$default_id}   # or Defaults value
ARGV_ch=${2:-$default_ch}   # or Default value

echo "$ARGV_id"
echo "$ARGV_ch"

my_id="$ARGV_id"
my_ch="$ARGV_ch"


# Loop forever (until break is issued)
while true; do

conf_url="rtmp://67.203.13.26:26998/live/$my_id/$my_ch/2"

Now_date=$(date +%F)
conf_destdir="/home/user/mystorage/$Now_date/$my_id"

echo $conf_url
echo $conf_destdir

echo "Wait for 10 seconds to start"
sleep 10

mkdir -p $conf_destdir

ffmpeg -nostdin -y -i "$conf_url" -f segment -strftime 1 -segment_time 60 -segment_format mp4 $conf_destdir/vid_$my_id-ch$my_ch--%Y-%m-%d_%H-%M-%S.mp4

# .end Loop 

done
