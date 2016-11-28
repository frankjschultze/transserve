#!/bin/bash

#is it osx crap
long=$2
short=${long:0:2}

filename=$(basename "$2")
extension="${filename##*.}"
filename="${filename%.*}"

if [ "$short" != "._" ]; then
	#audio
	ffmpeg -y -threads 0 -nostats -i "$1/$2" -vn -c:a libfdk_aac -b:a 96k -ar 48000 "/home/ingest/out_audio/$2"

	#100k
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 60k -c:v libx264 -profile:v high422 -s 356x200 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 32k -ar 48000 -pass 1 -f mp4 /dev/null && \
        ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 60k -c:v libx264 -profile:v high422 -s 284x140 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 32k -ar 48000 -pass 2 "/home/ingest/out_100k/${filename}_100k.${extension}"
	#120k
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 80k -c:v libx264 -profile:v high422 -s 302x170 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 32k -ar 48000 -pass 1 -f mp4 /dev/null && \
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 80k -c:v libx264 -profile:v high422 -s 302x170 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 32k -ar 48000 -pass 2 "/home/ingest/out_120k/${filename}_120k.${extension}"

	#150k
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 150k -c:v libx264 -profile:v high422 -s 356x200 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 1 -f mp4 /dev/null && \
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 150k -c:v libx264 -profile:v high422 -s 356x200 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 2 "/home/ingest/out_150k/${filename}_150k.${extension}"

	#200k
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 284k -c:v libx264 -profile:v high422 -s 498x280 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 1 -f mp4 /dev/null && \
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 284k -c:v libx264 -profile:v high422 -s 498x280 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 2 "/home/ingest/out_200k/${filename}_200k.${extension}"

	#450k
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 450k -c:v libx264 -profile:v high422 -s 704x396 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 1 -f mp4 /dev/null && \
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 450k -c:v libx264 -profile:v high422 -s 704x396 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 2 "/home/ingest/out_450k/${filename}_450k.${extension}"

	#750k
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 800k -c:v libx264 -profile:v high422 -s 896x504 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 1 -f mp4 /dev/null && \
	ffmpeg -y -threads 0 -i "$1/$2" -r 25 -b:v 800k -c:v libx264 -profile:v high422 -s 896x504 -preset veryslow -passlogfile ~/log/log -c:a libfdk_aac -b:a 128k -ar 48000 -pass 2 "/home/ingest/out_750k/${filename}_750k.${extension}"

	#delete
	rm -rf "$1/$2"
fi
exit 0
