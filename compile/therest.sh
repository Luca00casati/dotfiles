#!/bin/sh
set -e

make -j$(nproc)

sudo make install

 cat << EOF | sudo tee /usr/share/applications/emacs-wayland.desktop
[Desktop Entry]
Name=Emacs (Wayland)
GenericName=Text Editor
Comment=Edit text
MimeType=text/english;text/plain;
Exec=env EMACS_PGTK=1 emacs %F
Icon=emacs
Type=Application
Terminal=false
Categories=Development;TextEditor;
StartupWMClass=Emacs
Keywords=Text;Editor;
EOF
