#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11526160 9ef5dfc4562bdec94f59ff9b8ffab2bd4ee833f4 7428112 4fcd9e3c3edd914f53671d1ec808d3ff092e89ba
fi
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:11526160:9ef5dfc4562bdec94f59ff9b8ffab2bd4ee833f4; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:7428112:4fcd9e3c3edd914f53671d1ec808d3ff092e89ba EMMC:/dev/block/bootdevice/by-name/recovery 9ef5dfc4562bdec94f59ff9b8ffab2bd4ee833f4 11526160 4fcd9e3c3edd914f53671d1ec808d3ff092e89ba:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
