# staging-cluster-scripts
scripts for setting up a staging cluster for cm-ops

## Installing the cluster

```
# copy id
copy-id.sh $ROOT_PASS <master> <node1> <node2> ...

# Setup repositories to get updated hawkular + yum update
remote-script-execution.sh osh-centos7-bootstrap.sh <master> <node1> <node2> ...

```

Using openshift-ansible current master (I used 0c01e07493a4660f3eade5b96abefaa5b1f062b9 successfully) with the inventory file from this repository:
```
ansible-playbook playbooks/byo/config.yml -i /path/to/this/repo/inventory_file
```

Getting the secret
``````
remote-script-execution.sh osh-get-secret.sh <master>
cat <master>.log
```