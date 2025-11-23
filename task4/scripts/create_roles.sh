#!/usr/bin/env bash
set -euo pipefail

# Кластерные роли
kubectl apply -f manifests/clusterroles/

# Роли по доменным namespace'ам
for ns in sales tenant finance data; do
  kubectl -n "$ns" apply -f "manifests/roles/$ns/"
done

echo "ClusterRoles и Roles созданы."
