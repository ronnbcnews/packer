XISO_BIN = ../binaries/Darwin/bin/xorriso
XISO_OPTS = -report_about HINT -as mkisofs -graft-points -J -joliet-long -r -v -T -volid LINUX
ISO = boot.iso
PACKER = $(HOME)/Downloads/packer/packer
TEMPLATE = ../templates/packer/vagrant_centos_7_2_00.json
osxiso:
	hdiutil create -volname WhatYouWantTheDiskToBeNamed -srcfolder /path/to/the/folder/you/want/to/create -ov -format UDRW name.dmg

iso: clean
	hdiutil makehybrid -o $(ISO) -iso -joliet -eltorito-boot output/boot//grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -joliet-volume-name Linux output

xiso: clean
	$(XISO_BIN) $(XISO_OPTS) -b boot/grub/stage2_eltorito -no-emul-boot -boot-info-table -o $(ISO) output

clean:
	-rm -f $(ISO)

pack_centos_7_2: packer_validate_7_2 xiso
	$(PACKER) build $(TEMPLATE)

pack_centos_7_0: xiso
	$(PACKER) build ../templates/packer/vagrant_centos_7_0_00.json

packer_validate_7_2:
	$(PACKER) validate $(TEMPLATE)

box_centos_7_2: pack_centos_7_2
	vagrant box add -f --name centos_7_2 CentOS-7-1511-x86_64-virtualbox.box

box_centos_7_0: pack_centos_7_0
	vagrant box add -f --name centos_7_0 CentOS-7-1406-x86_64-virtualbox.box