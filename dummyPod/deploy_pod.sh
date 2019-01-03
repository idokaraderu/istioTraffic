#!/bin/sh

#----------------------------------------
# [What is this?]
# deploy httpbin pod and service N times
#----------------------------------------

podLimit=${1:-5}
namespace=${2:-default}
manifestPath="./httpbin.yaml"
sedTarget="httpbin-000"

for i in $(seq $podLimit)
do
    id=$(date +%s%3N)
    sed -e "s/$sedTarget/httpbin-$id/g" $manifestPath | kubectl -n $namespace apply -f -
done
