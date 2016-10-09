yum install epel-release -y
curl -o /etc/yum.repos.d/CentOS-OpenShift.repo https://tdawson.fedorapeople.org/centos/CentOS-OpenShift.repo
yum clean all
yum upgrade -y
yum clean all
yum install centos-release-paas-common centos-release-openshift-origin docker -y
