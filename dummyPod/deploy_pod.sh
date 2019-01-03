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
    paddedNumber=$(printf %03d $i)
    sed -e "s/$sedTarget/httpbin-$paddedNumber/g" $manifestPath | kubectl -n $namespace apply -f -
done
