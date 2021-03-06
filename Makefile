.PHONY: .default
.default: provision

export ANSIBLE_NOCOWS=1
ANSIBLE_PLAYBOOK_BIN:=.ansible-env/bin/ansible-playbook --vault-id vault-password

.PHONY: provision
provision: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_provision.yml

.PHONY: provision-masters
provision-masters: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_provision_masters.yml

.PHONY: provision-workers
provision-workers: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_provision_workers.yml

.PHONY: purge
purge: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_purge.yml

.PHONY: purge-workers
purge-workers: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_purge_workers.yml

.PHONY: purge-masters
purge-masters: .ansible
	$(ANSIBLE_PLAYBOOK_BIN) -i inventory_production.yml playbook_purge_masters.yml

.PHONY: vault-edit
vault-edit: .ansible
	.ansible-env/bin/ansible-vault edit vars_secret.yml --vault-id vault-password

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
