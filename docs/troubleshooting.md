# Fehleranalyse (simulierte Fälle)

## Ticket DEMO-001 – BitLocker fehlt
**Symptom:** LAB-PC-03 steht im Bericht als `NonCompliant`.
**Ursache:** Im synthetischen Input steht `bitlockerEnabled = false`.
**Lösung im Demo:** Eingabewert nur zur Verifikation ändern; in realen Umgebungen Ursache, Richtlinien und Berechtigungen prüfen.
**Prüfung:** Report erneut generieren und Status vergleichen.

## Ticket DEMO-002 – Defender deaktiviert
**Symptom:** LAB-PC-04 meldet `Defender disabled`.
**Diagnose:** Regel im PowerShell-Skript geprüft und Ergebnis im CSV nachverfolgt.
**Grenze:** Keine echte Defender-Konfiguration verändert.

## Ticket DEMO-003 – OS-Baseline und Firewall
**Symptom:** LAB-PC-05 erfüllt zwei Demo-Regeln nicht.
**Diagnose:** Beide Findings erscheinen im Report.
**Ergebnis:** Bericht priorisiert die Ursachen; keine Reparatur automatisiert.
