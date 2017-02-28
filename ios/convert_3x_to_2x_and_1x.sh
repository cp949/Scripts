#!/bin/sh

# need imagemagick

resize () {
	ls *@3x.png | awk '{print("convert "$1" -filter box -resize '$1' "$1)}' | sed 's/@3x/'$2'/2'
}



# resize 66.67% @2x
# resize 33.33% 

# convert twinkle_star@3x.png -filter box -resize 33.33% twinkle_star.png

today=`date +"%y%m%d"`
folder="_converted_$today"
mkdir -p $folder

for f in `ls *@3x.png`
do
	dest_2x=`echo $f | sed 's/@3x/@2x/1'`
	dest_1x=`echo $f | sed 's/@3x//1'`
	echo "$f ==>  $folder / $dest_2x   $dest_1x"
	convert $f -filter box -resize 66.67% $folder/$dest_2x
	convert $f -filter box -resize 33.33% $folder/$dest_1x
	cp $f $folder

done
