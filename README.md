# Jam Audio Terminal

Skrip gabut yang dapat diset pada cron sebagai notifikasi suara jam. Cara set ke crontab, silakan cari sendiri ya :")

## Sangkaran
Skrip ini dirilis tanpa memberikan garansi apapun kepada para pengguna. Silakan gunakan dengan kesadaran bahwa semua risiko merupakan tanggung jawab pengguna. DWYOR.

## Dependensi
Skrip ini menggunakan `sox` untuk memutar audio via CLI, pastikan paket-paket berikut telah terpasang sebelum menjalakan skrip.
- sox
- libsox-fmt-mp3


### Catatan 
Bila skrip dijalankan sebagai root, kemungkinan Anda akan menemui galat semacam ini;

```bash
ALSA lib pcm_dmix.c:1075:(snd_pcm_dmix_open) unable to open slave

play FAIL formats: can't open output file `default': snd_pcm_open error: Device or resource busy
```

Cara mengatasinya adalah dengan menambahkan perangkat Audio kedalam pengaturan `/etc/modprobe.d/default.conf`

Pertama, pastikan dulu jenis perangkat audi yang dipakai dengan menjalankan perintah;

```bash
lspci -knn|grep -iA2 audio

# Outputnya kurang lebih sepert di bawah ini
lspci -knn|grep -iA2 audio
00:1b.0 Audio device [0403]: Intel Corporation 7 Series/C216 Chipset Family High Definition Audio Controller [8086:1e20] (rev 04)
	Subsystem: Lenovo 7 Series/C216 Chipset Family High Definition Audio Controller [17aa:3977]
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel
```

Pada output di atas, terdeteksi perangkat audio saya adalah `snd_hda_intel`. Selanjutkan menambahkan konfigurasi pada `/etc/modprobe.d`.


```bash
# jalankan dengan sudo bila Anda tidak login sebagai root

echo "options snd_hda_intel index=1" >> /etc/modprobe.d/default.conf


# untuk sekadar memastikan, apakah teks di atas sudah masuk ke dalam berkas kongfigurasi jalankan;

cat /etc/modprobe.d/default.conf
```

Setelah beres, silakan reboot untuk me-_load_ perubahan.

---
Referensi:
- [ALSA (snd_pcm_dmix_open) unable to open slave](https://forums.debian.net/viewtopic.php?t=123902)