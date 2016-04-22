cd ~/pictures/apod
website=http://apod.nasa.gov/apod
pic_loc_tail=`curl $website/astropix.html -so - | grep -iPo '(?<=<img src=")(.*)(?=")'`
curl $website/$pic_loc_tail -O
cd -
