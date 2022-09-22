#!/bin/bash
until [ -f "firebase.json" ]
do
     echo "waiting for firebase.json"
     sleep 5
done
FUNCTIONS_PACKAGE_JSON="$(jq -r '.functions.source' firebase.json)/package.json"
until [ -f "$FUNCTIONS_PACKAGE_JSON" ]
do
     echo "waiting for functions package.json"
     sleep 5
done
firebase emulators:start
