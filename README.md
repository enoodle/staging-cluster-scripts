# staging-cluster-scripts
scripts for setting up a staging cluster

## Installing the cluster
Using openshift-ansible current master (I used 0c01e07493a4660f3eade5b96abefaa5b1f062b9 successfully) with the inventory file from this repository:
```
ansible-playbook playbooks/byo/config.yml -i /path/to/this/repo/inventory_file
```
