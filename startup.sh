#!/bin/bash
set -e

function do_help {
  echo HELP:
  echo "Supported commands:"
  echo "   master              - Start a Kudu Master"
  echo "   tserver             - Start a Kudu TServer"
  echo "   help                - print useful information and exit"
  echo ""
  echo "Other commands can be specified to run shell commands."
  echo "Set the environment variable KUDU_OPTS to pass additional"
  echo "arguments to the kudu process. DEFAULT_KUDU_OPTS contains"
  echo "a recommended base set of options."

  exit 0
}

echo "Welcome... Starting up...."

PERSIST="/data"
DATA_DIR="${PERSIST}/blocks"
LOG_DIR="${PERSIST}/logs"
WRITE_AHEAD="${PERSIST}/wal"

mkdir -p $DATA_DIR
mkdir -p $LOG_DIR
mkdir -p $WRITE_AHEAD

DEFAULT_KUDU_OPTS="-logtostderr \
 -fs_wal_dir=${WRITE_AHEAD} \
 -fs_data_dirs=${DATA_DIR} \
 -log_dir=${LOG_DIR}
 -use_hybrid_clock=false"

KUDU_OPTS=${KUDU_OPTS:-${DEFAULT_KUDU_OPTS}}

echo "KUDU_OPTS: " $KUDU_OPTS

if [ "$1" = 'master' ]; then
  echo "Running Master "
	exec kudu-master $KUDU_OPTS
elif [ "$1" = 'tserver' ]; then
  echo "Running server "
  exec kudu-tserver -tserver_master_addrs $KUDU_MASTER $KUDU_OPTS
elif [ "$1" = 'cli' ]; then
  echo "Running shell "
  shift; # Remove first arg and pass remainder to kudu cli
  exec kudu-ts-cli -server_address=${KUDU_TSERVER} ${KUDU_OPTS} "$@"
elif [ "$1" = 'help' ]; then
  do_help
fi

exec "$@"