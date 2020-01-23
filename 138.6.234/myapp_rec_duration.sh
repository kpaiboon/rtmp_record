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

Now_time=$(date +%"H%M%S")
#Now_date=$(date +%F)
Now_date=$(date +%"Y%m%d")
Now_hour=$(date +%"H")

echo ${Now_date}


conf_url="rtmp://0.0.0.0:26998/live/$my_id/$my_ch/2"

conf_destdir="/home/ubuntu/gallery/rec/D$Now_date/H$Now_hour/$my_id"
conf_destimage="${conf_destdir}/vid_${my_id}-ch${my_ch}--${Now_date}_${Now_time}.mp4"

echo $conf_url
echo $conf_destdir
echo $conf_destimage

ForceWaitSecond=4
#ForceWaitSecond=2
echo "Wait for ${ForceWaitSecond} seconds to start"
sleep ${ForceWaitSecond}


#exit 1 #brake point exit()


mkdir -p $conf_destdir

#ffmpeg -nostdin -y -i "$conf_url" -t 00:05:00 $conf_destimage

#Best One
## -timeout 2 (unit second) = 2 sec
#ffmpeg -nostdin -y -i "$conf_url" -timeout 2 -t 00:05:05 $conf_destimage

##  -use_wallclock_as_timestamps true # before  -i  , this high cost cpu usage 90%
#ffmpeg -nostdin -y  -use_wallclock_as_timestamps true -i "$conf_url" -t 00:05:00 $conf_destimage

#Test one
## -c copy , raw copy => 1.2-1.5 time large storage, no-cpu
ffmpeg -nostdin -y -i "$conf_url" -c copy -timeout 1 -t 00:02:00 $conf_destimage


# .end Loop 
done
