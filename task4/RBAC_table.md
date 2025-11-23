# RBAC для PropDevelopment

| Роль                                          | Права роли                                                                                                                                                                                                                                                                                                  | Группы пользователей                                    |
|-----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| **cluster-admin** (встроенная)                | Полный доступ ко всем ресурсам и операциям в кластере. Используется только для аварий/первичной инициализации.                                                                                                                                                                                              | *k8s-admins* (Lead SRE/DevOps; минимальный состав)      |
| **platform-configurer** (ClusterRole)         | Во всех namespace: create/update/patch/delete Deployments/StatefulSets/DaemonSets/Jobs/CronJobs/Services/Ingress/ConfigMaps/PVC; управлять NetworkPolicy; на уровне кластера: get/list/watch Nodes/StorageClasses; create/update/delete Namespaces, ResourceQuota, LimitRange. Без доступа к Secret и RBAC. | *platform-team* (DevOps/SRE) — «настраивают кластер»    |
| **secops-secrets-reader** (ClusterRole)       | get/list/watch Secrets во всех namespace (привилегированная операция), get/list/watch ConfigMaps/Pods для расследований. Без create/update/delete.                                                                                                                                                          | *secops* (ИБ/SOC)                                       |
| **domain-admin** (Role, namespace-scoped)     | Полное управление типовыми объектами приложения в своём namespace: Deployments/Services/Ingress/ConfigMaps/PVC/Jobs/NetworkPolicy и т.п.; без доступа к Secret и RBAC.                                                                                                                                      | *<domain>-team-leads* (тимлиды продукта в домене)       |
| **domain-developer** (Role, namespace-scoped) | create/update/patch/delete Deployments/Services/Ingress/ConfigMaps/Pods/Jobs; читать логи Pods; без Secret и RBAC.                                                                                                                                                                                          | *<domain>-developers* (разработчики конкретного домена) |
| **view** (встроенная ClusterRole)             | read-only: get/list/watch большинства ресурсов, просмотр логов; без Secret.                                                                                                                                                                                                                                 | *org-viewers* (аудит/поддержка, бизнес-заказчики)       |

Доменные неймспейсы:
 - sales
 - tenant
 - finance
 - data
 - platform
