# homelab-talos

This repository contains the configuration of my kubernetes homelab running on [Talos](https://www.talos.dev/).

```
apps            // applications manifests/helm charts, deployed via gitops
│   ...
│
└───infra       // infrastructure/system related applications (ingress-controller, storage ...)
│   │ ...
│
│
└───bootstrap   // applications required during the bootstraping (argocd ...).
│   │ ...
│
│
talos           // talos OS configuration
│   ...
```

## Preamble

My previous iteration of this cluster, also using GitOps can be found at `https://github.com/depp57/ops`.

<details>

I started this journey during the final year of my studies on October 1st 2023, after a 6-month internship at a company
specializing in Kubernetes and OpenShift. I loved the experience and wanted to learn more by building my own cluster.

![initial commit](doc/initial-commit-ops.png)

I made three major mistakes:

- **Automated... But not enough.** When I moved from my apartment, I understood that I have not automated everything,
  and it will be painful to rebuild everything.
- **No backup for storage.** I lost my data when I moved.
- **All secrets were hardcoded in the git repo.** Initially, to save time, I hardcoded them, planning to address this later.
  Now, the repository is saturated with secrets, preventing me from making it public without first rewriting the entire Git history.

</details>

## Hardware

Currently, it is a single-node cluster.

|      **Device**      | **Hostname** | **RAM** |      **CPU**      | **Disk** | **GPU** |
|:--------------------:|:------------:|:-------:|:-----------------:|:--------:|:-------:|
| Intel NUC NUC10i3FNK | server1      | 32GB    | I3-10110U · 2C/4T | 1To NVMe | N/A     |

## Network diagram

![home network](doc/home-network.jpg)
