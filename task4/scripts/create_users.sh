#!/usr/bin/env bash
set -euo pipefail

# Применяем namespace'ы и serviceAccount'ы
kubectl apply -f manifests/namespaces/
kubectl apply -f manifests/serviceaccounts/

echo "Namespaces и ServiceAccounts созданы."

# Печать короткоживущих токенов
echo "Tokens (may be short-lived):"
for pair in "sales:alice-dev" "data:diana-viewer" "platform:bob-secops" "platform:peter-platform"; do
  ns="${pair%%:*}"; sa="${pair##*:}"
  printf "\n--- %s/%s ---\n" "$ns" "$sa"
  kubectl -n "$ns" create token "$sa" || true
done
