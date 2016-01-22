XISO_BIN = ../binaries/$(shell uname -s)/bin/xorriso
XISO_OPTS = -report_about HINT -as mkisofs -graft-points -J -joliet-long -r -v -T -volid LINUX
ISO = boot.iso
PACKER = $(HOME)/Downloads/packer/packer
TEMPLATE = ../templates/packer/vagrant_centos_7_2_00.json
AWS_REGION = us-west-2

osxiso:
	hdiutil create -volname WhatYouWantTheDiskToBeNamed -srcfolder /path/to/the/folder/you/want/to/create -ov -format UDRW name.dmg

iso: clean
	hdiutil makehybrid -o $(ISO) -iso -joliet -eltorito-boot output/boot//grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -joliet-volume-name Linux output

xiso: clean cleanoutput
	$(XISO_BIN) $(XISO_OPTS) -b boot/grub/stage2_eltorito -no-emul-boot -boot-info-table -o $(ISO) output

clean:
	-rm -f $(ISO) *.box

pack_centos_7_2: packer_validate_7_2 xiso
	$(PACKER) build $(TEMPLATE)

pack_centos_7_0: xiso
	$(PACKER) build ../templates/packer/vagrant_centos_7_0_00.json

pack_centos_6_7: xiso
	$(PACKER) build ../templates/packer/vagrant_centos_6_7_00.json

pack_aws_centos_6_7: xiso
	$(PACKER) build ../templates/packer/aws_centos_6_7_00.json

packer_validate_7_2:
	$(PACKER) validate $(TEMPLATE)

box_centos_7_2: pack_centos_7_2
	vagrant box add -f --name centos_7_2 CentOS-7-1511-x86_64-virtualbox.box

box_centos_7_0: pack_centos_7_0
	vagrant box add -f --name centos_7_0 CentOS-7-1406-x86_64-virtualbox.box

box_centos_6_7: pack_centos_6_7
	vagrant box add -f --name centos_6_7 CentOS-6-7-x86_64-virtualbox.box

box_aws_centos_6_7: pack_aws_centos_6_7
	vagrant box add -f --name aws_centos_6_7 CentOS-6-7-x86_64-AWS.box

box_nolvm_centos_6_7: pack_aws_centos_6_7
	vagrant box add -f --name nolvm_centos_6_7 CentOS-6-7-x86_64-AWS.box

test:
	@echo hi

cleanoutput:
	@rm -rfv output-virtualbox-iso

aws_task_queue:
	@ec2-describe-conversion-tasks --region $(AWS_REGION) -O $(AWS_ACCESS_KEY) -W $(AWS_SECRET_KEY)

.PHONY: clean xiso test
