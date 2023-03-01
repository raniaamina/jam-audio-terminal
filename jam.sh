#!/bin/bash

if ! command -v play &> /dev/null
then
    echo "Paket 'sox' belum terpasang, skrip tidak dapat dijalankan"
     echo -e "SOX belum terpasang. Skrip gagal Dieksekusi $(date '+ (%H:%M:%S) %F')\n" >> jam.log
    exit 1
fi


CURRENTTIME=$(date '+%H')
play -q audio/$CURRENTTIME.mp3 -t alsa

if [[ $? == 0 ]]; then
    echo -e "Sukses $(date '+ (%H:%M:%S) %F')\n" >> jam.log
else
    echo -e "Gagal Dieksekusi $(date '+ (%H:%M:%S) %F')\n" >> jam.log
fi


if [[ $CURRENTTIME == "23" ]]; then
    echo "hapus log"
    rm jam.log
fi
