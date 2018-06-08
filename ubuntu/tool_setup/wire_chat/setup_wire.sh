wget -o /tmp/wire-3.0.2816-x86_64.AppImage https://wire-app.wire.com/linux/wire-3.0.2816-x86_64.AppImage

mv /tmp/wire-3.0.2816-x86_64.AppImage /opt/

chmod 555 /opt/wire-3.0.2816-x86_64.AppImage

ln -s /opt/wire-3.0.2816-x86_64.AppImage /bin/wire
