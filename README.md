# Bitwarden CLI Docker Image

Docker image with Bitwarden CLI and kubectl for Kubernetes secret synchronization.

## Contents
- Alpine Linux 3.19 base
- Bitwarden CLI v2025.9.0
- kubectl v1.28.0
- bash, curl, jq, wget

## Usage

Pull the image:
```bash
docker pull ghcr.io/n90-co/bitwarden-cli-docker:latest
```

Run interactively:
```bash
docker run -it ghcr.io/n90-co/bitwarden-cli-docker:latest
```

Use in Kubernetes CronJob:
```yaml
image: ghcr.io/n90-co/bitwarden-cli-docker:latest
command: ["/bin/bash", "/scripts/sync.sh"]
```

## Building

The image is automatically built and pushed to GitHub Container Registry on pushes to main.