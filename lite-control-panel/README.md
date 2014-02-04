##TODO
- [ ] Adjust icons and programs offically.
- [ ] Valtam add into to written by and proper copyright.
- [ ] Add gpl2 header to all files as needed
- [ ] eat zooses cupcakes


##Steps To Build Deb Package

dch -i to update changelog

cd to new dir created

make

dh_make --createorig # create single binary

debuild -S -sa # Compiles with .orig.tar.gz USE this method!!!

dput ppa:twodopeshaggy/liteppa ../controlcenter_1.0-1ubuntu4_source.changes







##Control File
```
Source: litecontrolpanel
Section: base
Priority: extra
Maintainer: Johnathan Jenkins <twodopeshaggy@gmail.com>
Build-Depends: debhelper (>= 8.0.0)
Standards-Version: 3.9.2
Homepage: https://www.linuxliteos.com
#Vcs-Git: git://git.debian.org/collab-maint/controlcenter.git
#Vcs-Browser: http://git.debian.org/?p=collab-maint/controlcenter.git;a=summary

Package: litecontrolpanel
Architecture: i386 amd64
Depends: ${shlibs:Depends}, ${misc:Depends}
Description: Linux Lite Simple Control Panel
 A tool to help you easily launch system tools on Linux Lite.
```