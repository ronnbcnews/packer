XISO_BIN = ../binaries/Darwin/bin/xorriso
XISO_OPTS = -report_about HINT -as mkisofs -graft-points -J -joliet-long -r -v -T -volid LINUX
ISO = $(HOME)/Documents/Vagrant/poopit/boot.iso
osxiso:
	hdiutil create -volname WhatYouWantTheDiskToBeNamed -srcfolder /path/to/the/folder/you/want/to/create -ov -format UDRW name.dmg

iso: clean
	hdiutil makehybrid -o $(ISO) -iso -joliet -eltorito-boot output/boot//grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -joliet-volume-name Linux output

xiso: clean
	$(XISO_BIN) $(XISO_OPTS) -b boot/grub/stage2_eltorito -no-emul-boot -boot-info-table -o $(ISO) output
clean:
	-rm -f $(ISO)
