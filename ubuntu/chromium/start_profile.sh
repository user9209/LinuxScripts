ls ~/.config/chromium/

chromium-browser --profile-directory=Default # unsecure
chromium-browser --profile-directory="Profile 1" # dauerLogin
chromium-browser --profile-directory="Profile 2" # privat


ChromiumUnsecure.desktop

cat << EOF > ~/Schreibtisch/ChromiumUnsecure.desktop
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=""chromium-browser --profile-directory=Default"" # unsecure
Name=Chromium Unsecure
Icon=/usr/share/icons/hicolor/scalable/apps/chromium-browser.svg
EOF


ChromiumLogin.desktop

cat << EOF > ~/Schreibtisch/ChromiumLogin.desktop
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=""chromium-browser --profile-directory="Profile 1""" # dauerLogin
Name=Chromium Login
Icon=/usr/share/icons/hicolor/scalable/apps/chromium-browser.svg
EOF


ChromiumPrivate.desktop

cat << EOF > ~/Schreibtisch/ChromiumPrivate.desktop
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=""chromium-browser --profile-directory="Profile 2""" # private
Name=Chromium Private
Icon=/usr/share/icons/hicolor/scalable/apps/chromium-browser.svg
EOF
