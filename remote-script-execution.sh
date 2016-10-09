if [ $# -lt '1' ] ; then
  echo "usage: remote-script-execution.sh script hostname [hostname..]"
  echo "example: remote-script-execution.sh ./osh-add-metric.sh host{1,2}.example.com"
  exit 1
fi

SCRIPT=$1
shift
TIMEOUT=260

echo "EXECUTION SCRIPT SELECTED: ${URL}"

RETRCODE=0
for HOST in $@; do
  echo "EXECUTING SCRIPT [HOST: ${HOST} TIMEOUT: ${TIMEOUT}]"
  scp -q ${SCRIPT} root@${HOST}:/root/script.sh
  #  ssh -l root ${HOST} wget --quiet -O script.sh  ${URL} || { echo "ERROR: could not get script" ; exit 1; }
  ssh -o ConnectTimeout=${TIMEOUT} -l root ${HOST} bash script.sh > ${HOST}.log 2>&1
  if [ $? -ne '0' ]; then
    RETRCODE=1
   fi
done

if [ ${RETRCODE} -ne '0' ]; then
  echo 'At least one script failed!'
fi
exit ${RETRCODE}

# TODO: check if one failed
