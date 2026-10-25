# Architektur (Demo)

```text
Fiktives IT-Inventar (JSON)
         |
         v
 PowerShell Baseline-Auswertung
         |
         +--> Mindest-OS-Build
         +--> BitLocker
         +--> Defender
         +--> Firewall
         |
         v
  CSV-Bericht für IT-Support
```

## Grenzen
- Keine Daten werden über ein Netzwerk übertragen.
- Keine Microsoft-API wird kontaktiert.
- Nur Testdaten sind im Repository enthalten.
- Ein echter Intune-Status ist komplexer und hängt von Plattform, Zuweisungen und Richtlinien ab.

## Warum diese Architektur?
Die lokale Simulation erlaubt die Entwicklung von Auswertungs- und Dokumentationskompetenz, auch ohne Zugriff auf einen produktiven Tenant. Eine spätere Integration darf nur in einer eigenen oder ausdrücklich freigegebenen Testumgebung erfolgen.
