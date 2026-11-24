# Projektjournal

| Datum | Änderung | Test durchgeführt? | Nachweis |
|---|---|---|---|
| Starter | Synthetische Inventardaten, PowerShell-Skript, Smoke-Test angelegt | Ursprünglich nicht lokal bestätigt | Quellcode |
| 23.11.2026 | CI-Smoke-Test unter GitHub Actions | Erfolgreich: 5 Geräte, 2 compliant, 3 noncompliant | [Workflow-Lauf 45266467933](https://github.com/yamen-chaban/enterprise-endpoint-compliance-lab/actions/runs/45266467933) |

**Wichtig:** Ergebnisse erst nach tatsächlicher Ausführung eintragen. Keine erfundenen Screenshots oder Zertifikate veröffentlichen.

## Eigene Lernfragen
1. Warum ist eine Compliance Policy nicht dasselbe wie ein Configuration Profile?
2. Was bedeutet ein nicht konformes Gerät für Conditional Access?
3. Welche Daten darf ein Helpdesk-Report enthalten?
4. Warum sind synthetische Daten in öffentlichen Repositories sinnvoll?

## Verifizierter CI-Nachweis

- Ausführung: 23.11.2026, 21:08 UTC, GitHub Actions (`ubuntu-latest`, PowerShell).
- Getesteter Commit: `ad17b9253f18ce5fc486fa1016e9cb7a6654fcf0`.
- Job `smoke-test`: success; Schritt `Run PowerShell test`: success.
- Protokoll: `Analyzed: 5; Compliant: 2; NonCompliant: 3` und `PASS: all smoke tests completed.`
- Quelle: [GitHub Actions](https://github.com/yamen-chaban/enterprise-endpoint-compliance-lab/actions/runs/45266467933).
- Nachweis am 24.11.2026 anhand des Jobprotokolls geprüft. Kein neuer lokaler Testlauf und kein Nachweis produktiver Intune-Geräteverwaltung.
