# citest

Dieses Repository demonstriert eine einfache CI/CD-Pipeline mit GitHub Actions und OpenTofu.

## Was passiert bei jedem Push?

Bei jedem Push auf den `main`-Branch führt GitHub Actions automatisch folgende Schritte aus:

1. Repository auschecken
2. Eine Handybenachrichtigung via [ntfy.sh](https://ntfy.sh) senden
3. Einen Ubuntu-Server (t2.micro) bei AWS EC2 in der Region `eu-central-1` deployen

## Infrastruktur

Die AWS-Infrastruktur wird mit [OpenTofu](https://opentofu.org) (Open-Source-Alternative zu Terraform) verwaltet und besteht aus:

- einer EC2-Instanz (Ubuntu 24.04, t2.micro)
- einem SSH-Key-Pair
- einer Security Group

## Voraussetzungen

Damit die CI funktioniert, müssen in den GitHub-Repository-Einstellungen unter *Settings → Secrets and variables → Actions* folgende Secrets hinterlegt sein:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`