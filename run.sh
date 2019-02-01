#!/bin/bash


LOCUST_CMD="/usr/local/bin/locust"
LOCUST_FILE_PATH="-f $LOCUST_FILE"
LOCUST_MODE=${LOCUST_MODE:-standalone}


if [ "$LOCUST_MODE" = "master" ]; then
  LOCUST_FILE_PATH="$LOCUST_FILE_PATH --csv=reports host=$TARGET_URL --master --no-web -c $USERS -r $HATCH_RATE -t $RUN_TIME --expect-slaves $SLAVES"                                                         
elif [ "$LOCUST_MODE" = "slave" ]; then
  LOCUST_FILE_PATH="$LOCUST_FILE_PATH --host=$TARGET_URL --slave --master-host=$MASTER_HOST"
fi


echo "$LOCUST_CMD $LOCUST_FILE_PATH"

$LOCUST_CMD $LOCUST_FILE_PATH