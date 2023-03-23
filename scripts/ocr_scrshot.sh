#!/bin/bash

# select tesseract_lang in eng esp ;do break;done

SCR_IMG=`mktemp`
trap "rm $SCR_IMG*" EXIT

gnome-screenshot -a -f $SCR_IMG.png

mogrify -modulate 100,0 -resize 400% $SCR_IMG.png
tesseract $SCR_IMG.png $SCR_IMG &> /dev/null
cat $SCR_IMG.txt | xsel -bi

exit
