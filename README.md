# Enterprise Endpoint Compliance Lab

> **Portfolio-Projekt (Simulation)** · Windows Endpoint Administration · PowerShell · Reporting

## Ziel
Ein fiktives Unternehmen mit 50 Mitarbeitenden benötigt einen nachvollziehbaren Bericht über grundlegende Sicherheitsmerkmale verwalteter Windows-Geräte. Dieses Repository enthält eine **eigenständig erstellte PowerShell-Auswertung** für synthetische Testdaten. Es ist **keine reale Intune-Integration** und **kein Nachweis einer produktiven Bereitstellung**.

## Umgebung
- PowerShell 7 oder höher (`pwsh`)
- Keine Azure-/Intune-Lizenz erforderlich
- Keine Administratorrechte erforderlich
- Fiktive Inventardaten in `data/devices.sample.json`

## Umsetzung
Das Skript `scripts/Get-EndpointComplianceReport.ps1` bewertet für jedes Gerät diese **nur für das Demo definierte** Baseline:

| Prüfkriterium | Demo-Regel |
|---|---|
| Windows OS Build | mindestens `22631` (konfigurierbar) |
| BitLocker | aktiviert |
| Microsoft Defender | aktiviert |
| Firewall | aktiviert |

Das Ergebnis ist eine CSV-Datei mit `Compliant` oder `NonCompliant` und einer Begründung. **Diese Regeln sind Demonstrationsregeln, keine vollständige Microsoft Intune-Compliance-Richtlinie.**

## Lokal ausführen

```powershell
pwsh ./scripts/Get-EndpointComplianceReport.ps1 -InventoryPath ./data/devices.sample.json -ReportPath ./output/compliance-report.csv
```

Tests ausführen:

```powershell
pwsh ./tests/Test-EndpointComplianceReport.ps1
```

Erwartet in der mitgelieferten Demo: **2 compliant / 3 noncompliant**. Die tatsächliche Ausgabe ist erst nach erfolgreicher Ausführung als getestet zu kennzeichnen.

## Projektstruktur

```text
enterprise-endpoint-compliance-lab/
├── .github/workflows/tests.yml
├── data/devices.sample.json
├── docs/architecture.md
├── docs/troubleshooting.md
├── docs/projektjournal.md
├── scripts/Get-EndpointComplianceReport.ps1
├── tests/Test-EndpointComplianceReport.ps1
├── .gitignore
├── SECURITY.md
└── README.md
```

## Problem → Lösung → Ergebnis → Gelernt

- **Problem:** Ein IT-Support-Team muss auffällige Gerätekonfigurationen priorisieren.
- **Lösung:** Prüfroutinen und standardisierter CSV-Report statt manueller Einzelprüfung.
- **Ergebnis:** Reproduzierbare Auswertung der synthetischen Testdaten. Noch keine echte Geräteverwaltung.
- **Gelernt:** PowerShell-Objekte, JSON, Validierung, nachvollziehbare Abweichungsgründe, Tests und Dokumentation.

## Grenzen / Nächste Version

1. Demodaten erweitern und mehr Randfälle testen.
2. Eine lokal *autorisierte* Testumgebung erstellen und Ergebnisse vergleichen.
3. Erst mit ausdrücklicher Berechtigung und geeignetem Test-Tenant die Verbindung zu Microsoft Intune / Graph untersuchen.
4. Screenshots nur von eigenen Demo-Daten und eigener Umgebung verwenden.

## Für Bewerbungen
**Relevanz:** Junior IT-Systemadministrator, 2nd-Level-Support, Endpoint/Modern Workplace Administration.

**Kurzbeschreibung für das Vorstellungsgespräch:**
> Ich habe ein PowerShell-Tool entwickelt, das synthetische Windows-Geräteinventardaten anhand einer konfigurierbaren Sicherheits-Baseline auswertet, Abweichungen erklärt und einen CSV-Report erstellt. Die Tests sind im Repository dokumentiert. Eine produktive Intune-Integration ist ausdrücklich nicht Teil dieser Version.

## Datenschutz / Rechte
Keine Passwörter, Tokens, echte Geräteinventare, Kundendaten, Kursmaterialien, Screenshots aus dem Unterricht oder alfatraining-spezifischen Dateien veröffentlichen. Vor dem Einsatz eines Schulungsgeräts oder einer Schulungsumgebung die Nutzungsregeln beachten.

## Referenzen
- [Microsoft Learn – Intune Compliance Policies](https://learn.microsoft.com/en-us/intune/device-security/compliance/overview)
- [GitHub – Best Practices for Repositories](https://docs.github.com/en/repositories/creating-and-managing-repositories/best-practices-for-repositories)

**Status:** Starter-Repository. Nach dem ersten echten Testlauf die Resultate im Projektjournal ergänzen.

## Täglicher Lern- und Entwicklungsplan (26.10.–20.11.2026)

Der [tägliche 20-Tage-Portfolio-Plan](docs/daily-course-to-github-roadmap.md) verbindet angekündigte Weiterbildungsthemen mit **eigenen, unabhängigen** GitHub-Übungen. Offene Aufgaben sind in den [GitHub Issues](../../issues) erfasst. Alle Einträge sind Vorschläge und erst nach praktischer Umsetzung erledigt.
