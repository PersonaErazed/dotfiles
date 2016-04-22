oFile=~/.bg-list.dat
dbFile=/usr/share/photos/digikam4.db

cSQL='Select Albums.relativePath, Images.name From Albums, Images, Tags, ImageTags 
      Where Tags.id=ImageTags.tagid AND Images.id=ImageTags.imageid AND Tags.name IN ("Desktop","desktop","bg","Background","background") AND Albums.id=Images.album;'

echo .output $oFile$'\n'$cSQL | sqlite3 $dbFile

mv $oFile $oFile-tmp
cat $oFile-tmp | sed -e 's/|/\//' | sed 's:^:'$( dirname $(readlink $dbFile) )':' >> $oFile
rm $oFile-tmp
