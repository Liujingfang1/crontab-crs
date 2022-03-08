#!/bin/bash

mkdir -p configs
rm -f configs/*

cat > configs/ns.yaml <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: crontab-ns
EOF

for n in {1..50}
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


#for n in {51..100}
#do
#  cat >> configs/crs.yaml <<EOF
#---
#apiVersion: "stable.example.com/v1"
#kind: CronTab
#metadata:
#  name: cr-${n}
#  namespace: crontab-ns
#  annotations:
#    configmanagement.gke.io/managed: disabled
#spec:

#cronSpec: "* * * * */5"
# extra: field
#EOF
#done
