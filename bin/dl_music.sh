website=$(xclip -o)
title=$(curl $website -so - | tr -d '\n' | grep -iPo '(?<=<title>)(.*)(?=</title>)')
file="$HOME/music/youtube/download_$(date +%F%H%M%S) $title.mp3"
echo "downloading video from $website"
echo "to $file"
echo $title

vlc -q $website --sout="#transcode{vcodec=none,acodec=mp3,ab=128,channels=2,samplerate=44100}:std{access=file,mux=mp3,dst='$file'}" vlc://quit &
sleep 1s
xdotool key alt+shift+6
