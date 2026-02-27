# Streiknachmittag: Wir bauen eine Website! :-)

## Zutaten

- Domain: Wir nehmen eine Subdomain von
  einer Domain, die Ingo gehört.
- Server
  - Hardware: Wir mieten bei Amazon AWS
    und automatisieren den Mietvorgang über
    Tofu, angestoßen durch die CI bei jedem
    Push ins Repository
  - Software: Nginx als Websiteauslieferungsapp, ???
- Websiteinhalt: HTML-Code, abgelegt im
  Repository


## Wichtiges modernes SI-Prinzip

"Behandle Server nicht wie Haustiere, sondern wie Vieh", das heißt:

- Server nicht über Monate hinweg mühevoll einrichten.
- Sondern um automatische Bereitstellung kümmern. Server ganz nach Bedarf
  zerstören oder erschaffen.



## Schmierzettel

```
# Dann den Ordner /var/www/html mit dem gewünschten Inhalt befüllen
```
