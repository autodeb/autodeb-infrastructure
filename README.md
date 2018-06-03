# auto.debian.net infrastructure

This repository contains Ansible scripts for provisionning the infrastructure for auto.debian.net.

Currently, the infrastructure is accessible at:
 - http://auto.debian.net/

Everything is operated from the Makefile using the following targets:
 - ``provision``: provisions both the master server and the workers
 - ``provision-master``: provisions only the master
 - ``provision-workers``: provisions only the workers
 - ``purge``: purge autodeb-worker and autodeb-server from all hosts
 - ``purge-workers``: purge only workers
 - ``purge-master``: purge only the master
 - ``vault-edit``: edit ``vars_secret.yml`` (requires that you have created the ``vault-password`` file)

If you want to be authorized on the machines, you should open a pull request to add yourself to ``roles/common/tasks/authorized_keys.yml``.
Then, ask any of the already-authorized users to run ``make provision`` and you should now have shell access to all machines.

This repository contains an encrypted file: ``vars_secret.yml``.
It is encrypted using ansible-vault.
If you are given the password to this file, write it in a file named ``vault-password`` at the root of the repository.
You may edit ``vars_secret.yml`` with ``make vault-edit``.
``vars_secret.yml`` contains the following variables:
 - ``oauth_client_secret``
 - ``autodeb_api_access_token``

Runtime dependencies of the Makefile targets in this repository include:
 - make
 - python3
 - virtualenv
