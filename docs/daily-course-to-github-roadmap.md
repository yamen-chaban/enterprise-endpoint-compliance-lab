# Kurs → GitHub: täglicher Entwicklungsplan (26.10.–20.11.2026)

**Projekt:** Enterprise Endpoint Compliance Lab  
**Ziel:** Jeden Kurstag eine kleine, überprüfbare Verbesserung an einem **eigenständigen Demonstrationsprojekt** umsetzen.  
**Status:** **Plan/Vorschläge**, keine erledigten Aufgaben und kein offizieller Kursplan.

Die Themen-Spalte ist eine kurze eigene Zusammenfassung des für die Microsoft-Endpoint-Einheit angekündigten Stoffes. Die **GitHub-Aufgaben sind selbst entworfene Portfolio-Übungen**, keine Aufgaben oder Materialien von alfatraining. Änderungen am tatsächlichen Unterricht gehen vor. Bei einer Änderung den Plan aktualisieren, nicht falsche Erledigungen eintragen.

## Tägliche Qualitätsroutine (20–45 Minuten nach dem Unterricht)
1. **Verstehen:** In 2–3 eigenen Sätzen erklären, was heute neu war.
2. **Umsetzen:** Genau **eine kleine Verbesserung** an Skript, Test oder eigener Dokumentation vornehmen.
3. **Prüfen:** `pwsh ./tests/Test-EndpointComplianceReport.ps1` ausführen und Ergebnis/Fehler festhalten.
4. **Dokumentieren:** `docs/projektjournal.md` ergänzen: **Ziel → Umgebung → Umsetzung → Problem → Lösung → Ergebnis → Was ich gelernt habe**.
5. **Veröffentlichen:** Keine Passwörter, QR-Codes, echten Nutzerdaten, Tenant-IDs oder geschützten Kursmaterialien committen. Nur nach wirklichem Test „getestet“ schreiben.

## Woche 1 — Identitäten und Geräte (26.–30.10.)

| Datum | Angekündigtes Thema (Kurzform) | Eigenständiger GitHub-Arbeitsschritt | Definition of Done |
|---|---|---|---|
| Mo 26.10. | Cloud, Azure, Entra ID, Tenant, Rollen und Portale | Architektur-Skizze der fiktiven 50-Personen-Firma und Begriffserklärungen in `docs/architecture.md` ergänzen | Eigenes Diagramm + Unterschied Tenant/Subscription/License/Rolle erläutert |
| Di 27.10. | Entra ID, Geräteanbindung und Intune Enrollment | Demo-Inventar um `joinType` und `enrollmentState` erweitern (nur simuliert) | JSON validiert; Werte im Journal erklärt |
| Mi 28.10. | Compliance, Windows Hello, LAPS, lokale Gruppen | Dokument mit vier getrennten Sicherheitskonzepten und passenden Demo-Prüfkriterien erstellen | Keine erfundene Live-Konfiguration; Unterschiede in eigenen Worten |
| Do 29.10. | Windows-Clients bereitstellen/aktualisieren | OS-Build-Baseline im PowerShell-Skript und passende positive/negative Tests prüfen bzw. verbessern | Beide Testfälle nachweisbar |
| Fr 30.10. | Device Configuration Profiles | Eigenes Beispiel für eine Gerätekonfigurations-Richtlinie als JSON oder Markdown entwerfen | Scope, Regel, erwartetes Resultat, Konfliktfall dokumentiert |

## Woche 2 — Verwaltung und Sicherheit (02.–06.11.)

| Datum | Angekündigtes Thema (Kurzform) | Eigenständiger GitHub-Arbeitsschritt | Definition of Done |
|---|---|---|---|
| Mo 02.11. | Configuration Profiles, Intune Suite | Tabelle `Compliance Policy vs. Configuration Profile` erstellen; Demo-Policy-Zuordnung vorbereiten | Unterschied, Zielgruppe, Testfall dokumentiert |
| Di 03.11. | Intune Suite Zusatzfunktionen | Nur tatsächlich besprochene/selbst geprüfte Zusatzfunktionen in `docs` vergleichen | Quellen/Beobachtung markiert; keine Lizenzbehauptung |
| Mi 04.11. | Remote Actions | Einen **Dry-Run/Simulation-Entwurf** für Geräteaktionen dokumentieren; keine echten Remote-Eingriffe | `WhatIf`-Prinzip, Berechtigung, Auditierbarkeit erklärt |
| Do 05.11. | Endpoint Security | `Findings` um `Severity` (selbst definierte Demo-Regel) ergänzen und testen | Beispielmeldungen und Test für Schweregrade |
| Fr 06.11. | Defender Integration | Synthetischen Defender-Status oder Test-Alert auswerten | Sichere Demodaten + nachvollziehbare Auswertung |

## Woche 3 — Updates, Apps und Automatisierung (09.–13.11.)

| Datum | Angekündigtes Thema (Kurzform) | Eigenständiger GitHub-Arbeitsschritt | Definition of Done |
|---|---|---|---|
| Mo 09.11. | Intune Update-Verwaltung | Demo-Eigenschaft `lastPatchDate` ergänzen und `outdated` nachvollziehbar bestimmen | Veralteter und aktueller Patch-Fall getestet |
| Di 10.11. | App Deployment / Updates | Fiktives App-Inventar und CSV-Auswertung von Installationsstatus erstellen | Erfolgreiche und fehlgeschlagene App simuliert |
| Mi 11.11. | App Protection / App Configuration | Zwei **eigene** illustrative Richtlinienbeispiele dokumentieren | Unterschied erklärt; keine echten Kurs-Screenshots |
| Do 12.11. | PowerShell und Microsoft Graph | PowerShell-Funktionen sauber modularisieren; Graph-Datenformat mit Mock-JSON vorbereiten | Testbar **ohne** Token, Tenant oder API-Zugriff |
| Fr 13.11. | Analytics, Remediation, Berichte, Monitoring | Status-Zusammenfassung (Anzahl/Quoten/Top Findings) auf Demodaten erstellen | Ausgabe geprüft, Grenzen dokumentiert |

## Woche 4 — Eigene Projektarbeit, Präsentation, Prüfung (16.–20.11.)

| Datum | Thema laut Plan | Sinnvoller Portfolio-Schritt | Definition of Done |
|---|---|---|---|
| Mo 16.11. | Projektphase | Individuelle Projektziele mit Dozierenden-Vorgaben abgleichen; eigenen Portfolio-Code getrennt halten | Erlaubte Artefakte und Projektumfang geklärt |
| Di 17.11. | Projektphase | Eigene Skripte, Beispiel-Daten und Tests bereinigen | Reproduzierbare Ausführung dokumentiert |
| Mi 18.11. | Projektphase | Prüfergebnisse und Troubleshooting-Fälle mit ausschließlich eigenen Demodaten fertigstellen | Keine Fremd-/Kursdaten veröffentlicht |
| Do 19.11. | Präsentation / Bewertung | 5-Minuten-Demo und deutschen Projekt-Pitch üben | Problem, Lösung, Grenzen, Lerngewinn verständlich erklärt |
| Fr 20.11. | MD-102 im Kursplan | Priorität: offizielle Prüfungsanweisungen; danach optional Journal/Fazit aktualisieren | Nur **gebuchten** Termin als bestätigte Prüfung behandeln |

**Achtung:** Der offizielle Stoff ist ein Orientierungsplan; nicht garantiert, dass jede Einheit exakt wie vorgesehen durchgeführt wird. 16.–20.11.2026 ist laut allgemeiner alfatraining-Zeittabelle eine besondere Unterrichtswoche bis **17:10**. Das ist **kein Beleg**, dass jeder regionale Feiertag in Brandenburg unterrichtsfrei ist. Tatsächliche Unterrichtszeiten beim Lehrteam bestätigen.

## Nach dem ersten Kurs
- **23.11.–18.12.2026:** Azure-Administration. Neues eigenes Repository für Azure-Infrastruktur/Bicep vorbereiten, **sobald der offizielle Tagesplan vorliegt**.
- **21.12.2026–22.01.2027:** CompTIA Network+. Separates selbst erstelltes Netzwerk-Lab (z. B. GNS3) dokumentieren, **sobald Details und Berechtigungen vorliegen**.
- **24.12.2026–01.01.2027:** Laut Schulungsunterlagen unterrichtsfrei.
- Nicht so tun, als seien die Tagesinhalte von Azure/Network+ bereits bekannt.

## Vorlage für das tägliche Check-in
```text
Datum:
Heute tatsächlich gelernt (3 Stichworte):
Was habe ich persönlich umgesetzt?
Welche Dateien habe ich geändert?
Wie habe ich getestet? (Befehl + Ergebnis)
Was funktioniert noch nicht?
Was ist morgen mein nächster Schritt?
```

## Grenzen
- Keine Weitergabe urheberrechtlich geschützter alfatraining-Unterlagen.
- Auf Schulgeräten keine Software ohne Freigabe installieren.
- Öffentliche Repositories enthalten ausschließlich eigene, freigegebene, anonymisierte Beispiele.
- GitHub-Checklisten sind **keine automatischen Push-Erinnerungen**. Die Benachrichtigungen der Aufgaben-App müssten gesondert eingerichtet werden.
