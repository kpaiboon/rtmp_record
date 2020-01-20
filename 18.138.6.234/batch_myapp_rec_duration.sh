fsname="/home/ubuntu/gallery/myapp_rec_duration.sh"
shname="myapp_rec_duration.sh"

ForceWaitSecond=2
echo "Wait for ${ForceWaitSecond} seconds to start"
sleep ${ForceWaitSecond}

killall -9 ${shname}
killall -9 ffmpeg

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









