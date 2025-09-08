# External Secrets Operator

I have set up **E**xternal **S**ecrets **O**perator (ESO) to work with [Bitwarden Secrets Manager](https://bitwarden.com/products/secrets-manager/).

## Bitwarden integration with ESO

### Dependency

To use the Bitwarden provider, you need an additional service called the [Bitwarden SDK Server](https://github.com/external-secrets/bitwarden-sdk-server).

This service can be installed alongside ESO by enabling it in the Helm chart: 

```yaml
bitwarden-sdk-server:
  enabled: true
```

### Certificate

The Bitwarden SDK Server **must** run over HTTPS. I generate its certificate using *cert-manager*.

The `bitwarden-certs.yaml` file contains the required resources for this setup.
