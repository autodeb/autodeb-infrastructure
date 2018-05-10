.PHONY: .default
.default: provision

export ANSIBLE_NOCOWS=1
ANSIBLE_PLAYBOOK_BIN:=.ansible-env/bin/ansible-playbook

.PHONY: provision
provision: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_site.yml

.PHONY: provision-master
provision-master: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_master.yml

.PHONY: provision-workers
provision-workers: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_workers.yml

.PHONY: purge
purge: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_purge.yml

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
