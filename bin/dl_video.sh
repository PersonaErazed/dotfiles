website=$(xclip -o)
file="$HOME/videos/download_$(date +%F%H%M%S).mp4"
echo "downloading video from $website"
echo "to $file"

vlc -q $website --sout="#transcode{vcodec=h264,acodec=mpga,ab=128,channels=2,samplerate=44100}:std{access=file,mux=mp4,dst='$file'}" vlc://quit &
sleep 1s
xdotool key alt+shift+6
