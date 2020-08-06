#!/bin/bash

# this is a workaround until I figure out how to make use of `podman play kube`
# with the pod*yaml file

set -exuo pipefail

export runtime_dir_path=${1}
export unit_full_name=${2}


echo "cleanup possible old state"
podman stop simpleserver exportersidecar ||:
podman rm simpleserver exportersidecar ||:
podman pod rm -f simpleservertest ||:
podman pod rm -f simpleserver_pod ||:
rm -rf ${runtime_dir_path}/${unit_full_name}-pid
rm -rf ${runtime_dir_path}/${unit_full_name}-cid


echo "create the pod"
podman pod create --name simpleserver_pod -p 8080:80 -p 9117:9117

echo "create the simpleserver container in the pod"
podman run --pod=simpleserver_pod --health-interval=30s --conmon-pidfile ${runtime_dir_path}/${unit_full_name}-pid --cidfile ${runtime_dir_path}/${unit_full_name}-cid --name simpleserver -p 8080:80 -detach simpleserver:latest

echo "create the apache exporter sidecar"
podman run --pod=simpleserver_pod --name exportersidecar -p 9117:9117 -detach bitnami/apache-exporter

echo "DONE"
