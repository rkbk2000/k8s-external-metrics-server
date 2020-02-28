#!/bin/sh

fqdn=`hostname -f`
OUTF=build/external-metrics-server.yaml

echo "---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: hpa-controller-external-metrics-user
subjects:
- kind: User
  name: ${fqdn}
  apiGroup: rbac.authorization.k8s.io
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: external-metrics-server-resources
---" >> ${OUTF}
