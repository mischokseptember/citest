# Streiknachmittag: Wir bauen eine Website! :-)

## Zutaten

- Domain: Wir nehmen eine Subdomain von einer Domain, die Ingo gehört.
- Server
  - Hardware: Wir mieten bei Amazon AWS und automatisieren den Mietvorgang über
    Tofu, angestoßen durch die CI bei jedem Push ins Repository
  - Software: Nginx als Websiteauslieferungsapp, Websiteinhalt über git clone
    aus dem Repository beziehen
- Websiteinhalt: HTML-Code, abgelegt im Repository


## Wichtiges modernes SI-Prinzip

"Behandle Server nicht wie Haustiere, sondern wie Vieh", das heißt:

- Server nicht über Monate hinweg mühevoll einrichten.
- Sondern um automatische Bereitstellung kümmern. Server ganz nach Bedarf
  zerstören oder erschaffen.



## Alternative

Wenn man nicht daran interessiert ist, Administrationszugriff auf einen eigenen
Server zu haben, sondern einfach nur eine Website ausliefern möchte, kann man
auch das kostenlose Angebot "Pages" von GitHub verwenden.

(Genau gibt es GitLab Pages. GitHub gehört zu Microsoft; GitLab ist (in einer
etwas abgespeckten Version) freie Software.)
