# auto.debian.net infrastructure

This repository contains Ansible scripts for provisionning the infrastructure for auto.debian.net.

Currently, the infrastructure is accessible at:
 - http://auto.debian.net/

Everything is operated from the Makefile using the following targets:
 - ``provision``: provisions both the master server and the workers
 - ``provision-master``: provisions only the master
 - ``provision-workers``: provisions only the workers
 - ``purge``: purge autodeb-worker and autodeb-server from all hosts

This repository contains nothing that is private but it cannot be used without being authorized on the machines.
If you want to be authorized on the machines, you should open a pull request to add yourself to ``roles/common/tasks/authorized_keys.yml``.
Then, ask any of the already-authorized users to run ``make provision`` and you should now have shell access to all machines.

Runtime dependencies of the Makefile targets in this repository include:
 - make
 - python3
 - virtualenv
