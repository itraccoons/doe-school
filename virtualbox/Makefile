# CONGIGURATION 
DIRSRC=./src
VBOSIMAGE=CentOS7-base.ova
VMNAME=centos-
VMCOUNT=2
VMNAMEN=$(VMNAME)$${i}
VMMACADDRN=FEFEFEFEFE1$${i}
VBMCMD=VBoxManage


# MAIN
ALL: list	# list all available targets

vms-import:	# import VB virtual appliance
	@ for ((i=0;i<$(VMCOUNT);i++)); do \
	    $(VBMCMD) import $(DIRSRC)/$(VBOSIMAGE) -vsys 0 --vmname $(VMNAMEN); \
	    $(VBMCMD) modifyvm $(VMNAMEN) --nic1 bridged --bridgeadapter1="en1: Wi-Fi (AirPort)"; \
	    $(VBMCMD) modifyvm $(VMNAMEN) --macaddress1 $(VMMACADDRN); \
	done
	
vms-remove:
	@ for ((i=0;i<$(VMCOUNT);i++)); do \
	    echo $(VMNAMEN) `$(VBMCMD) unregistervm $(VMNAMEN) --delete`; \
	done
vms-list:
	@ $(VBMCMD) list vms

vms-running:
	$(VBMCMD) list runningvms

vms-state:
	@ for ((i=0;i<$(VMCOUNT);i++)); do \
		echo $(VMNAMEN) `$(VBMCMD) showvminfo $(VMNAMEN) | grep -i state`; \
	done

vms-start:
	@ for ((i=0;i<$(VMCOUNT);i++)); do \
		$(VBMCMD) startvm $(VMNAMEN) --type headless; \
	done

vms-stop:
	@ for ((i=0;i<$(VMCOUNT);i++)); do \
	    echo $(VMNAMEN); \
	    $(VBMCMD) controlvm $(VMNAMEN) poweroff; \
	done

vms-ips:
	nmap -v0 -n -sP 10.0.1.0/24
	@ for ((i=0;i<$(VMCOUNT);i++)); do \
	    MACN=`$(VBMCMD) showvminfo $(VMNAMEN) | grep "NIC 1" | cut -d"," -f1 | tail -c 13`; \
	    IPN=`arp -an | tr -d : | grep -i $(VMMACADDRN)`;\
	    echo $(VMNAMEN) $${MACN} $${IPN}; \
	done

list:		# list of commands
	grep "^[a-z]" Makefile | sed "s/://g"
