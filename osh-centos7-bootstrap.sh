yum install epel-release -y
yum clean all
yum upgrade -y
yum clean all
yum install centos-release-paas-common centos-release-openshift-origin docker -y
