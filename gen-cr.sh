#!/bin/bash

mkdir -p configs
rm -f configs/*

for n in {51..100}
do
  cat >> configs/crs.yaml <<EOF
---
apiVersion: "stable.example.com/v1"
kind: CronTab
metadata:
  name: cr-${n}
  namespace: crontab-ns
spec:
  cronSpec: "* * * * */5"
  extra: field
EOF
done
