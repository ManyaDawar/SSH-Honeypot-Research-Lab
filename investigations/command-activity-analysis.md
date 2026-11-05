# Command Activity Analysis

## Scope

Analysis of five controlled SSH sessions against the
Northstar Analytics Cowrie honeypot.

All sessions originated from 127.0.0.1 and were
generated during local testing.

## Observed Commands

| Command | Count |
|---|---:|
| cat /var/log/northstar/deploy.log | 5 |
| ls | 1 |
| ls -la | 1 |
| whoami | 1 |
| uname -a | 1 |
| ls -la /home/analyst | 1 |
| cat /home/analyst/notes.txt | 1 |
| exit | 3 |

## Findings

- The deployment log was requested five times.
- One session performed basic system and user-directory
  discovery before reading analyst notes.
- The TTY recording for session b38b43711471 confirmed
  that the notes file contents were displayed.
- Command input events establish which commands were
  submitted, but do not independently prove successful
  execution or file transfer.

## Limitations

- All activity was generated locally for testing.
- The sessions do not represent independent external attackers.
- No evidence of file transfer, exploitation, or lateral
  movement was identified in this analysis.
