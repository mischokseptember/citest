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

## Terraform State

OpenTofu verwaltet alle angelegten AWS-Ressourcen über eine sogenannte **State-Datei** (`terraform.tfstate`). Darin steht, welche Ressourcen OpenTofu zuletzt angelegt hat. Ohne diese Datei hat OpenTofu kein Gedächtnis: Es weiß nicht, was bereits existiert, und würde bei jedem CI-Lauf versuchen, alles neu anzulegen — was zu Fehlern wie `InvalidKeyPair.Duplicate` führt.

### Wo wird der State gespeichert?

In diesem Projekt wird die State-Datei direkt im Repository gespeichert. Nach jedem `tofu apply` committet die CI die aktualisierte `terraform.tfstate` automatisch zurück ins Repo (Commit-Nachricht: `[skip ci]`, damit kein weiterer CI-Lauf ausgelöst wird).

### Alternativen

Die professionelle Lösung wäre ein **S3-Backend**: Die State-Datei liegt dann in einem AWS S3-Bucket und ist für alle CI-Läufe zentral erreichbar. Für ein einfaches Lernprojekt ist die Git-Variante jedoch ausreichend.

## Voraussetzungen

Damit die CI funktioniert, müssen in den GitHub-Repository-Einstellungen unter *Settings → Secrets and variables → Actions* folgende Secrets hinterlegt sein:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`