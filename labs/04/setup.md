# Lab 4 – Task 1: Set up your Agent

## 1. Tool und Version

| Frage | Antwort |
|---|---|
| Welches Tool habe ich verwendet? | GitHub Copilot Chat in Visual Studio Code |
| Welche Version? | VS Code 1.144.0 (User Setup), Copilot Chat (Built-in) |
| Welches Modell? | Auto; in einer Sitzung wurde GPT-6 Luna angezeigt. |
| Betriebssystem | Windows |

## 2. Berechtigungen und Tests

| Frage | Antwort |
|---|---|
| In welchem Berechtigungsmodus startete das Tool? | Manual permissions mit automatischer Genehmigung von Dateiänderungen. |
| Wie habe ich den Modus geändert? | Ich habe in der `settings.json` die Einstellung `"chat.tools.edits.autoApprove": {"**/*": false}` ergänzt. |
| Konnte der Agent Dateien ohne Nachfrage lesen? | Ja. Er hat den Inhalt des Ordners untersucht und `.git` sowie `README.md` gefunden. |
| Konnte der Agent Dateien ohne Nachfrage erstellen? | Ja, beim ersten Versuch wurde `hello.txt` ohne vorherige Bestätigung erstellt. |
| Was passierte nach der Änderung der Einstellungen? | Copilot fragte vor dem Erstellen von `hello.txt` nach meiner Zustimmung. |
| Konnte der Agent Terminalbefehle ohne Nachfrage ausführen? | Ja. Der Befehl `git --no-pager log` wurde ohne Bestätigung ausgeführt. |
| Wie kann ich Änderungen sehen? | Über die Änderungsanzeige in Copilot, `git status` und `git diff`. |
| Wie kann ich Änderungen rückgängig machen? | Mit der Schaltfläche `Undo` in Copilot oder mit Git bzw. durch das Löschen neu erstellter Dateien. |
| Funktionierte der Plan-Modus? | Ja. Copilot erstellte einen Plan für ein PowerShell-Skript zum Zählen von Dateien. Ich habe den Plan gelesen und mit `Reject` abgelehnt. |

## 3. Neue Sitzung, Context Window und Nutzung

| Frage | Antwort |
|---|---|
| Wie starte ich eine neue Sitzung? | Über `New Chat (+)` im Copilot-Chatfenster. |
| Wo sehe ich das Context Window? | Die Auslastung des Context Windows konnte ich in der Benutzeroberfläche nicht finden. |
| Wie viel Kontingent wurde verbraucht? | Auf der GitHub-Abrechnungsseite wurden für November 2026 Kosten von 0 USD angezeigt. Der genaue Verbrauch des enthaltenen Kontingents war dort nicht ersichtlich. |

## 4. Instruction Files

GitHub Copilot kann die Datei `AGENTS.md` als Anweisungsdatei für Coding Agents verwenden.

In meinem Test-Repository gab es keine `AGENTS.md`. Deshalb habe ich in dieser Aufgabe keine zusätzlichen projektspezifischen Anweisungen verwendet.

## 5. Datenschutz

In den GitHub-Copilot-Einstellungen unter **Privacy** ist die Option **Allow GitHub to use my data for AI model training** auf **Disabled** gesetzt.

Damit erlaube ich GitHub nicht, meine Prompts, Antworten und den zugehörigen Kontext für das Training von KI-Modellen zu verwenden.

Die Option **Suggestions matching public code** steht auf **Allowed**.

## 6. Warum habe ich GitHub Copilot gewählt?

Ich habe GitHub Copilot gewählt, weil es direkt in Visual Studio Code integriert ist und ich VS Code bereits für meine Programmieraufgaben verwende. Der Einstieg ist einfach und Copilot bietet eine kostenlose Nutzung mit bestimmten Limits. Außerdem kann ich mit GitHub und Git meine Änderungen kontrollieren und rückgängig machen. Die Datenschutzeinstellungen lassen sich im GitHub-Konto anpassen. Für die Zusammenarbeit im Team ist Copilot ebenfalls praktisch, weil wir mit denselben Git-Repositories arbeiten können.