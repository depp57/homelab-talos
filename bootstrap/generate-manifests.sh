#!/bin/bash
set -o pipefail  # Ensures the script catches errors even during piping/redirection

echo "Generating argoCD manifest ..."
kubectl kustomize ./bootstrap/argocd > ./bootstrap/argocd/manifest.yaml || { echo "❌ Error: ArgoCD generation failed"; exit 1; }
echo "✅ ArgoCD manifest successfully generated"

echo "Generating cilium manifest ..."
kubectl kustomize --enable-helm ./bootstrap/cilium > ./bootstrap/cilium/manifest.yaml || { echo "❌ Error: Cilium generation failed"; exit 1; }
rm -r ./bootstrap/cilium/charts
echo "✅ Cilium manifest successfully generated"

echo "Generating external secret manifest ..."
sops decrypt ./bootstrap/external-secrets/bitwarden-secret.sops.yaml --output ./bootstrap/external-secrets/bitwarden-secret.yaml || { echo "❌ Error: SOPS decryption failed"; exit 1; }
echo "✅ External secret manifest successfully generated"
