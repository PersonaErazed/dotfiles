cd ~/media/pictures/apod

for i in `seq 1 500`; do
  day=`date -d "$(date) -$i days" +%y%m%d`
  website=http://apod.nasa.gov/apod
  pic_loc_tail=`curl $website/ap$day.html -so - | grep -iPo '(?<=<img src=")(.*)(?=")'`
  curl $website/$pic_loc_tail -O
done;

cd -
