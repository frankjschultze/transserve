#!/bin/bash

ffmpeg -y -i "$1/$2" \
-r 25 -b:v 60k -c:v libx264 -profile:v high422 -s 284x140 -preset veryslow -c:a libfdk_aac -b:a 32k -pass 1 -f mp4 /dev/null && \
-r 25 -b:v 60k -c:v libx264 -profile:v high422 -s 284x140 -preset veryslow -c:a libfdk_aac -b:a 32k -pass 2 "/usr/share/nginx/html/upload/server/php/files/out_100k/$2" \
-r 25 -b:v 80k -c:v libx264 -profile:v high422 -s 302x170 -preset veryslow -c:a libfdk_aac -b:a 32k -pass 1 -f mp4 /dev/null &&  \
-r 25 -b:v 80k -c:v libx264 -profile:v high422 -s 302x170 -preset veryslow -c:a libfdk_aac -b:a 32k -pass 2 "/usr/share/nginx/html/upload/server/php/files/out_120k/$2" \
-r 25 -b:v 150k -c:v libx264 -profile:v high422 -s 356x200 -preset veryslow -c:a libfdk_aac -b:a 128k -pass 1 -f mp4 /dev/null && \
-r 25 -b:v 150k -c:v libx264 -profile:v high422 -s 356x200 -preset veryslow -c:a libfdk_aac -b:a 128k -pass 2 "/usr/share/nginx/html/upload/server/php/files/out_150k/$2" \
-r 25 -b:v 284k -c:v libx264 -profile:v high422 -s 498x280 -preset veryslow -c:a libfdk_aac -b:a 128k -pass 1 -f mp4 /dev/null && \
-r 25 -b:v 284k -c:v libx264 -profile:v high422 -s 498x280 -preset veryslow -c:a libfdk_aac -b:a 128k -pass 2 "/usr/share/nginx/html/upload/server/php/files/out_200k/$2" \
-r 25 -b:v 450k -c:v libx264 -profile:v high422 -s 704x396 -preset veryslow  -c:a libfdk_aac -b:a 128k -pass 1 -f mp4 /dev/null && \
-r 25 -b:v 450k -c:v libx264 -profile:v high422 -s 704x396 -preset veryslow  -c:a libfdk_aac -b:a 128k -pass 2 "/usr/share/nginx/html/upload/server/php/files/out_450k/$2" \
-r 25 -b:v 800k -c:v libx264 -profile:v high422 -s 896x504 -preset veryslow  -c:a libfdk_aac -b:a 128k -pass 1 -f mp4 /dev/null && \
-r 25 -b:v 800k -c:v libx264 -profile:v high422 -s 896x504 -preset veryslow  -c:a libfdk_aac -b:a 128k -pass 2 "/usr/share/nginx/html/upload/server/php/files/out_750k/$2" \
-vn -c:a libfdk_aac -b:a 96k "/usr/share/nginx/html/upload/server/php/files/out_audio/$2"
