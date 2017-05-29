# staging-cluster-scripts
scripts for setting up a staging cluster for cm-ops

## Installing the cluster

```
# Tested on CentOS 7.3
# install packages needed on deployment machine
yum install ansible git-all

# clone this repo
git clone https://github.com/enoodle/staging-cluster-scripts
STAGING_PATH=$(realpath staging-cluster-scripts)

# clone openshift-ansible
git clone https://github.com/openshift/openshift-ansible
OPENSHIFT_ANSIBLE_PATH=$(realpath openshift-ansible)
```

```
# copy id - Relace with ansible + cloud init
# ssh-keygen -t rsa
copy-id.sh $ROOT_PASS <master> <node1> <node2> ...

# Setup repositories to get updated hawkular + yum update
remote-script-execution.sh osh-centos7-bootstrap.sh <master> <node1> <node2> ...

```

Using openshift-ansible current master (I used 0c01e07493a4660f3eade5b96abefaa5b1f062b9 successfully) with the inventory file from this repository:
```
ansible-playbook ${OPENSHIFT_ANSIBLE_PATH}/playbooks/byo/config.yml -i ${STAGING_PATH}/inventory_file
ansible-playbook -vvv OPENSHIFT_ANSIBLE_PATH/playbooks/byo/config.yml -e state=absent -i STAGING_CLUSUTER_PATH/inventory_centos_latest.ini \
                 -e infra1_ipaddress=10.35.48.3 \
                 -e master1_ipaddresses=[10.35.48.5 ] \
                 -e nfs_server_host=vm-48-7.eng.lab.tlv.redhat.com \
                 -e compute1_ipaddress=10.35.48.6
```

Getting the secret
``````
remote-script-execution.sh osh-get-secret.sh <master>
cat <master>.log
```