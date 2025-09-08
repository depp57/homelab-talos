# Bootstrap

I'm bootstrapping the cluster by using Talos's `extraManifest` to deploy manifests in this directory at startup:

*talos/talconfig.yaml*
```yaml
inlineManifests:
  - name: argocd
    contents: "@../bootstrap/argocd/manifest.yaml"
    skipEnvsubst: true
  - ...
```

This installs ArgoCD, which then takes over to deploy the remaining manifests from the Git repo.

Additionally, a Kubernetes Secret `bitwarden-access-token` is created during bootstrap.
This secret is required by `External Secrets Operator` to fetch secrets, which in turn is necessary for running the other applications.

## Kustomization

Since the [standard Argo CD manifest](https://github.com/argoproj/argo-cd/blob/master/manifests/install.yaml) installs
it in the `default` namespace and lacks custom options, I use Kustomize.

To generate the final manifest, I run:

```shell
kubectl kustomize bootstrap/argocd > bootstrap/argocd/manifest.yaml
```

The generation of this manifest is automated via a GitHub Action defined in `.github/workflows/kustomize-gen-bootstrap.yaml`.
