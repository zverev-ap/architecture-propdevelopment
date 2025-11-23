## Проверка прав (вручную)

### dev в sales может деплоить, но не читать секреты

```bash
kubectl auth can-i create deploy -n sales --as=system:serviceaccount:sales:alice-dev
kubectl auth can-i get secret -n sales --as=system:serviceaccount:sales:alice-dev
```

### SecOps читает секреты в любом неймспейсе

```bash
kubectl auth can-i get secrets -n finance --as=system:serviceaccount:platform:bob-secops
kubectl auth can-i get secrets -n sales --as=system:serviceaccount:platform:bob-secops
```

### Viewer только читает

```bash
kubectl auth can-i get deploy -n data --as=system:serviceaccount:data:diana-viewer
kubectl auth can-i patch deploy -n data --as=system:serviceaccount:data:diana-viewer
kubectl auth can-i get secrets -n data --as=system:serviceaccount:data:diana-viewer
```

### Platform-configurer управляет кластером, но не секретами

```bash
kubectl auth can-i create namespace --as=system:serviceaccount:platform:peter-platform
kubectl auth can-i get secrets -n sales --as=system:serviceaccount:platform:peter-platform
```
