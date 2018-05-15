.PHONY: .default
.default: provision

export ANSIBLE_NOCOWS=1
ANSIBLE_PLAYBOOK_BIN:=.ansible-env/bin/ansible-playbook

.PHONY: provision
provision: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_provision.yml

.PHONY: provision-master
provision-master: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_provision_master.yml

.PHONY: provision-workers
provision-workers: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_provision_workers.yml

.PHONY: purge
purge: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_purge.yml

.PHONY: purge-workers
purge-workers: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_purge_workers.yml

.PHONY: purge-master
purge-master: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_purge_master.yml

.PHONY: .ansible
.ansible: .ansible-env

.ansible-env:
	rm -rf .ansible-env
	virtualenv -p python3 .ansible-env
	.ansible-env/bin/pip install -r ansible-requirements.txt

.PHONY: clean
clean:
	rm -rf .ansible-env

	# generated at runtime
	rm -f playbook_*.retry
