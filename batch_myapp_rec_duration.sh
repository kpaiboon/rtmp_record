ForceWaitSecond=2
echo "Wait for ${ForceWaitSecond} seconds to start"
sleep ${ForceWaitSecond}

killall -9 myapp_rec_duration.sh
killall -9 ffmpeg

killall -9 myapp_rec_duration.sh
killall -9 ffmpeg


ForceWaitSecond=3
echo "Wait for ${ForceWaitSecond} seconds to start backgroud process"
sleep ${ForceWaitSecond}


./myapp_rec_duration.sh 0866758044537963 4 &
./myapp_rec_duration.sh 0866758044537963 3 &
./myapp_rec_duration.sh 0866758044537963 2 &
./myapp_rec_duration.sh 0866758044537963 1 &



echo "done"









