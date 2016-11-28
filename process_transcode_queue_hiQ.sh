#!/bin/bash

TMPDIR=`mktemp -d`
trap "rm -rf $TMPDIR" EXIT

#is it osx crap
long=$2
short=${long:0:2}

filename=$(basename "$2")
extension="${filename##*.}"
filename="${filename%.*}"

if [ "$short" != "._" ]; then
	#r128 audio
	ffmpeg -nostats -threads 0 -i "$1/$2" -vn -filter_complex ebur128 -f null - 2> "$TMPDIR/r128.txt"
	line=$(tail "$TMPDIR/r128.txt" | grep I:)
	read -r _ r128 _<<< "$line"

	correct=$(echo "(-23)-($r128)" | bc)
	correct="${correct}dB"

	ffmpeg -threads 0 -y -i "$1/$2" -af "volume=$correct" "/home/ingest/out_qa/${filename}_r128.${extension}"
	sleep 2

	#ffmpeg -threads 0 -y -i "/usr/share/nginx/html/upload/server/php/files/out_qa/${filename}_r128.${extension}" -r 25 -c:v libx264 -vf scale=1920:1080 -preset medium -crf 10 -c:a libfdk_aac -b:a 128k -ar 48000 -pass 1 -f mp4 /dev/null && \
	ffmpeg -threads 0 -y -i "/home/ingest/out_qa/${filename}_r128.${extension}" -r 25 -c:v libx264 -vf scale=1920:1080 -preset slow -crf 10 -c:a libfdk_aac -b:a 128k -ar 48000 "/home/ingest/out_qa/${filename}_hiq.${extension}" 
	#move to processed
	rm -rf "/home/ingest/out_qa/${filename}_r128.${extension}"
	sleep 1
	#rm -rf "$1/$2"
fi
exit 0
