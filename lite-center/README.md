## Linux Lite Control Center
Executing the program can be done by executing the command lite-center.

##Depends
Keep in mind our target is solely ubuntu, these package names may vary on another distro.
Or by opening Lite Center from menu>settings

Depends: python, python-webkit, python-gtk2, pciutils

##Building INFO
Commands are run in the lite-center-1.0 folder.

dch -i # it's important to follow the versioning of previous releases

dh_make --createorig

debuild -S -sa

dput ppa:twodopeshaggy/liteppa ../lite-center_1.0-0010_source.changes 

##TODO:
- [ ] Change url for help to local manual before 2.0 relase
- [ ] Still needs clean up and removal of icons not needed, used during testing.
- [ ] Comment on functions more in depth.
- [ ] Add LDC members to about dialog, pdq, armageddon etc who helped.
- [ ] Gain Jedi powers to over take the senate.
- [ ] Build control file and other things needed to build Debian package.
- [ ] Collect needed information in regards to modules and pre-configured tools.