dirname="/home/ubuntu/gallery"
shname="myapp_rec_duration.sh"
fsname="${dirname}/${shname}"

echo ${fsname}

#exit 1 #brake point exit()

ForceWaitSecond=2
echo "Wait for ${ForceWaitSecond} seconds to start"
sleep ${ForceWaitSecond}

#ffmpeg
#Newer versions of ffmpeg don't use 'q' anymore, at least on Ubuntu Oneiric, 
#instead they say to press Ctrl+C to stop them. 
#So with a newer version you can simply 
#use 'killall -INT' to send them SIGINT instead of SIGTERM, and they should exit cleanly.

## signal(SIGINT , sigterm_handler); /* Interrupt (ANSI).    */
## signal(SIGTERM, sigterm_handler); /* Termination (ANSI).  */

pkill -INT ffmpeg
sleep 0.2
pkill -15 ffmpeg
sleep 0.3
killall -15 ${shname}
sleep 0.2

killall -9 ${shname}
pkill -15 ffmpeg


ForceWaitSecond=1
echo "Wait for ${ForceWaitSecond} seconds to start backgroud process"
sleep ${ForceWaitSecond}


#exit 1 #brake point exit()


${fsname} 0866758044537963 4 &
${fsname} 0866758044537963 3 &
${fsname} 0866758044537963 2 &
${fsname} 0866758044537963 1 &

${fsname} 0861585040494534 4 &
${fsname} 0861585040494534 3 &
${fsname} 0861585040494534 2 &
${fsname} 0861585040494534 1 &

${fsname} 0866758042049359 4 &
${fsname} 0866758042049359 3 &
${fsname} 0866758042049359 2 &
${fsname} 0866758042049359 1 &



echo "done"
