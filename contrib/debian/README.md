
Debian
====================
This directory contains files used to package trpcd/trpc-qt
for Debian-based Linux systems. If you compile trpcd/trpc-qt yourself, there are some useful files here.

## trpc: URI support ##


trpc-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install trpc-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your trpcqt binary to `/usr/bin`
and the `../../share/pixmaps/trpc128.png` to `/usr/share/pixmaps`

trpc-qt.protocol (KDE)

