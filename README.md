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

If you want to be authorized on the machines, you should open a pull request to add yourself to ``roles/common/tasks/authorized_keys.yml``.
Then, ask any of the already-authorized users to run ``make provision`` and you should now have shell access to all machines.

This repository contains an encrypted file, ``vars_secret.yml``.
If you are given the password to this file, write it in a file named ``vault-password`` in the root of the repository.
This file is encrypted using ansible-vault and it contains the following variables:
 - ``oauth_client_id``
 - ``oauth_client_secret``

Runtime dependencies of the Makefile targets in this repository include:
 - make
 - python3
 - virtualenv
