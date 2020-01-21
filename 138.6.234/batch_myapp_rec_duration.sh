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

killall -9 ${shname}
sleep 1
killall -INT ffmpeg
sleep 1

killall -9 ${shname}
killall -9 ffmpeg


ForceWaitSecond=3
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


echo "done"