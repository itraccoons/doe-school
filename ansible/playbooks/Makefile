###############################################################################

BASE_DIR	:= $(shell cd .. && pwd)
YL_CMD		:= $(shell which yamllint)
YL_FILES	:= ./*.yml ./common/
AP_CMD		:= ANSIBLE_HOST_KEY_CHECKING=False
AP_CMD		+= $(shell which ansible-playbook)
AG_CMD		:= $(shell which ansible-galaxy)
INVENTORY	:= ${BASE_DIR}/config/inventory
ROLES_DIR	:= ./roles
ROLES		:= ./requirements.yml
PLAYBOOK	?= main.yml

RED		= \033[0;31m	# Red color 
NC		= \033[0m	# No Color

###############################################################################
.PHONY: %

ALL: help		# .default 
help:			# Show list of commands
	@ grep "^[a-z]" Makefile| sed "s/://g"

requirements:		# Install roles described at requirements.yml
	$(AG_CMD) install --role-file ${ROLES} --roles-path=${ROLES_DIR}

#create-role:		# Create skeleton role $ make create-role ROLE=<rolename>
#	 @ if [ ${ROLE}x = x ]; then \
#	    echo "${RED}Role name not specified.\nRun: make create-role ROLE=<rolename>${NC}"; \
#	    exit 1; \
#	fi
#	$(AG_CMD) init --init-path=${ROLES_DIR} ${ROLE}
	
validate:		# Validate YAML files with yamllint
#	@ $(YL_CMD) -d relaxed ./*.yml ./common/
	$(YL_CMD) ${YL_FILES}
	$(AP_CMD) -i ${INVENTORY} ${PLAYBOOK} --syntax-check

dry-run: validate	# Simulation. Check Mode
	$(AP_CMD) -i ${INVENTORY} ${PLAYBOOK} --check

play:  validate		# Let's play but validate before
	$(AP_CMD) -i ${INVENTORY} ${PLAYBOOK}

show-hosts:		# Show ansible inventory
	@ grep -E '^[^#].*ansible_host' ${INVENTORY}

show-groups:		# Show ansible inventory
	@ grep -E '^\[' ${INVENTORY} | grep -v ':'

ssh-keygen:
	ssh-keygen -b 4029 -f ${BASE_DIR}/config/id_rsa
