# Build Helm Chart of Gitea App

## Overview
In this module, we build the official Helm chart from the developers of the Gitea application in a Kubernetes cluster.

## Directories
- `helm-chart`
- `workspace_vars`

### workspace_vars
This directory contains workspace variables to override values in the Helm chart.

### helm-chart
This directory consists of the Helm chart of Gitea.

## gitea
```yaml
appVersion: 1.22.0
dependencies:
  - name: redis-cluster
```
## Pre Build

### Replace the Database Values in Workspace Vars with Actual Ones
```
gitea:
  config:
    database:
      DB_TYPE: postgres
      HOST: "IP:PORT"
      NAME: DB_NAME
      USER: DB_USER
      PASSWD: DB_PASS
```

### Set Admin Account
```
gitea:
  admin:
    existingSecret:
    username: awesome_admin
    password: "changeMePlease"
    email: "awesome_admin@local.domain"
```

## Build Helm

### Install Dependency
```
helm dependency update ./helm-chart/
```

### Build Helm Chart
```
helm install [name] ./helm-chart/ --values ./helm-chart/values.yaml -f ./workspace_vars/dev-01-gitea.yaml
```

### Delete Helm Chart
```
helm delete [name]
```