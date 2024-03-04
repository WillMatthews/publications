#!/bin/bash

echo "Making thumbnails for publication PDF files"

files=$(find ./pdf)

var=0
for FILE in $files; do

    # Skip the first file (it's the directory name)
    var=$((var + 1))
    if [ $var -eq 1 ]
    then
        continue
    fi

    # Output thumbnail is a png file, with the same name as the pdf file
    out="${FILE%.pdf}.png"
    out_indir="./thumbs${out:5}"

    # Check if the thumbnail already exists
    if [ -f $out_indir ]
    then
        echo "Thumbnail already exists: $out_indir"
        continue
    fi

    # Convert the first page of the pdf to a thumbnail
    echo $out_indir
    convert -scale '350x350+0+0>' -colorspace rgb -background white -alpha remove -alpha off -strip $FILE[0] $out_indir
done;

echo "Done"
