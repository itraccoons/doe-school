###############################################################################

AP_CMD		:= $(shell which ansible-playbook)
AG_CMD		:= $(shell which ansible-galaxy)
YL_CMD		:= $(shell which yamllint)
INVENTORY	:= "$(shell pwd)/../config/hosts"
ROLES_DIR	:= "./roles"
ROLES		:= "./requirements.yml"
PLAYBOOK	:= main.yml

###############################################################################

all: help	# 

help:		# Show list of commands
	@ grep "^[a-z]" Makefile| sed "s/://g"

requirements:	# Install roles described at requirements.yml
	ansible-galaxy install --role-file $(ROLES) --roles-path=$(ROLES_DIR)

validate:
	@ $(YL_CMD) -d relaxed ./*.yml

run: validate
	$(AP_CMD) -i $(INVENTORY) $(PLAYBOOK)

