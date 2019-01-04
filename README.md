# istioTraffic

Data of traffic istio-proxy sent

## Environment

* Istio: 1.0.5, helm install, default setting
* Kubernetes: 1.11.5 (Azure Kubernetes Service)
* Cluster: 5 nodes of Standard DS2 v2 (2 vcpu, 7 GB mem)
* Pod: [httpbin](https://github.com/istio/istio/blob/1.0.5/samples/httpbin/httpbin.yaml) with istio-proxy

## Condition

* Monitor RX bytes and TX byte data
* Using [trafficmonitor](https://github.com/idokaraderu/trafficmonitor/blob/master/pod_traffic_monitor.py)
* Get data every 5 seconds
* Change number of pods from 1 to 100

## Results

* [pod_001.txt](./pod_001.txt): data of 1 pod
* [pod_010.txt](./pod_010.txt): data of 10 pods
* [pod_050.txt](./pod_050.txt): data of 50 pods
* [pod_100.txt](./pod_100.txt): data of 100 pods

## Appendix

* [deploy script](./dummyPod)
    ```sh
    # Usage
    cd ./dummyPod
    ./deploy_pod.sh 50 #deploy 50 httpbin pods
    ```
* [k8s Service data](./svc_information.txt) (20 pods)
* [k8s Pod data](./pod_information.txt) (20 pods)
* [pcap data of istio-proxy without any access](./istio-proxy.pcap)
* [pcap data of istio-proxy with access to httpbin container every second](./istio-proxy-with-pod-access.pcap)