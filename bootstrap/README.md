# Bootstrap

I'm bootstrapping the cluster by using Talos's `inlineManifests` to deploy manifests in this directory at startup:

*talos/talconfig.yaml*
```yaml
inlineManifests:
  - name: argocd
    contents: "@../bootstrap/argocd/manifest.yaml"
    skipEnvsubst: true
  - ...
```

This deploys two critical components:

- [Cilium](https://github.com/cilium/cilium): A **C**ontainer **N**etwork **I**nterface (CNI).
Since no other components can function without a CNI, Cilium must be installed during bootstrap.  

- [ArgoCD](https://github.com/argoproj/argo-cd): Responsible for deploying the remaining manifests from the Git repo.

Additionally, a Kubernetes Secret `bitwarden-access-token` is created.
This secret is required by [External Secrets Operator](https://github.com/external-secrets/external-secrets) to fetch secrets needed by other workloads.

## Generating manifests

Since the generated manifests contain sensitive data, they are not committed to Git.

Instead, they are generated locally right before bootstrapping the cluster by running the convenient script:

```shell
./generate-manifests.sh
```
