# COMPLETELY INSECURE

if [ $# -lt '2' ] ; then
  echo "usage: copy-id.sh password [hostname ..]"
  echo "example: copy-id.sh kuku host{1..8}.example.com"
  exit 1
fi

PASS=$1
shift

for HOST in $@; do
  ssh-keygen -R ${HOST}
  ssh-keyscan ${HOST} >> ~/.ssh/known_hosts
  sshpass -p${PASS} ssh-copy-id root@${HOST}
done
