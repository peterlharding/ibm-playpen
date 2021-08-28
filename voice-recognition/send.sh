#!/bin/sh

set -x

# WebSocket:
# wss://api.{location}.speech-to-text.watson.cloud.ibm.com/instances/{instance_id}/v1/recognize

grep APIKEY ../.CREDENTIALS | awk '{print $2}'
APIKEY=`grep APIKEY ../.CREDENTIALS | awk '{print $2}'`

URL=https://api.au-syd.speech-to-text.watson.cloud.ibm.com/instances/8a63fe87-41d9-4e39-a35e-3f90bc70fd58

FILE=$1

curl -X POST -u "apikey:${APIKEY}" \
      --header "Content-Type: audio/flac" \
      --data-binary @${FILE} \
      "${URL}/v1/recognize?model=en-AU_Telephony"

# &max_alternatives=3"


