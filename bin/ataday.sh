sudo umount /mnt/usb
sudo mount /dev/disk/by-id/$(ls /dev/disk/by-id/ | grep -i multi | grep -i card | grep -i part | sed s/@//) /mnt/usb
trail_day=$(date -d "$(date) + 5 days" +'%b %e')
random_file=$(ls -d -l /mnt/usb/**/*/* | grep "$trail_day" | grep -i jpg | cut -c46- | shuf -n1)
echo "$random_file" | xargs feh --bg-max

