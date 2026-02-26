# Willkommen

Dies ist eine schlichte statische Website, die automatisch per CI/CD deployed wird.

## Was passiert im Hintergrund?

Bei jedem Push auf den `main`-Branch wird ein neuer Server bei AWS gestartet,
der diese Seite ausliefert.

## Technologie

- **Server:** AWS EC2 t2.micro (Ubuntu 24.04)
- **Webserver:** nginx
- **Deployment:** GitHub Actions + OpenTofu
