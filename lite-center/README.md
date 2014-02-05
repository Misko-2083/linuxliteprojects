## Linux Lite Control Center

Currently the bash script located in base dir, is to be placed in /usr/bin.
And the folder litecc, in /usr/share.
Execting the program can be done by executing the command litecontrolcenter.

Depends: python, python-webkit, python-gtk2, pciutils

##Building INFO
dch -i # it's important to follow the versioning of previous releases
dh_make --createorig
debuild -S -sa
dput ppa:twodopeshaggy/liteppa ../lite-center_1.0-0010_source.changes 

##TODO:
- [ ] Still needs clean up and removal of icons not needed, used during testing.
- [ ] Comment on functions more in depth.
- [ ] Add LDC members to about dialog, pdq, armageddon etc who helped.
- [ ] Gain Jedi powers to over take the senate.
- [ ] Build control file and other things needed to build Debian package.
- [ ] Collect needed information in regards to modules and pre-configured tools.