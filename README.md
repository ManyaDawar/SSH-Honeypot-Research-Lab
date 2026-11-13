# SSH Honeypot Research Lab

A hands-on cybersecurity research project focused on SSH threat monitoring, attacker behaviour analysis, credential intelligence, and automated security investigations using Cowrie.

## Overview

This project explores how attackers interact with exposed SSH services and how their activity can be captured, analyzed, and documented.

I deployed a Cowrie SSH honeypot in Kali Linux and created a simulated Linux server environment containing fictional user accounts, application configurations, internal notes, and database backups.

The goal is to build an environment where SSH activity can be safely simulated, captured, and investigated. I am also expanding the project with Python automation to generate repeatable SSH activity and improve log analysis.

## Project Objectives

- Deploy and configure an SSH honeypot using Cowrie.
- Simulate a realistic Linux server environment to attract and observe attacker reconnaissance.
- Analyze SSH authentication attempts and identify credential reuse patterns.
- Investigate attacker commands and session activity.
- Automate SSH interactions and reconnaissance using Python.
- Develop workflows for analyzing collected files and identifying suspicious activity.
- Document findings and map observed behaviour to MITRE ATT&CK techniques.

## Architecture

```text
              Kali Linux
                  |
          +-------+--------+
          |                |
     Cowrie SSH        Simulated Linux
      Honeypot          Filesystem
          |                |
          +-------+--------+
                  |
           SSH Interactions
                  |
          Cowrie JSON Logs
                  |
          +-------+--------+
          |                |
     Authentication    Command and
       Analysis        Session Analysis
          |                |
          +-------+--------+
                  |
           Investigation
              Reports
```

*Python-based SSH automation and file analysis workflows are planned extensions.*

## Implemented Features

### 1. SSH Honeypot Deployment

- Deployed Cowrie 3.1.4 on Kali Linux.
- Configured SSH access on localhost using port 2222.
- Configured authentication using Cowrie's UserDB.
- Captured successful and failed authentication attempts, SSH sessions, and command activity.
- Collected structured JSON logs and terminal session recordings.

### 2. Simulated Linux Server Environment

Created a fictional server environment representing Northstar Analytics.

The simulated filesystem contains:

- Fictional Linux user accounts and home directories.
- Application configuration files.
- Internal operational notes.
- Deployment logs.
- Database backup files containing synthetic data.
- A fictional internal web application.

This environment provides realistic-looking files for investigating reconnaissance and file discovery behaviour.

### 3. SSH Session Investigation

Analyzed controlled SSH sessions to understand post-login activity.

Investigated commands including:

- `whoami`
- `uname -a`
- `ls -la`
- `cat`
- `exit`

Used Cowrie terminal recordings and JSON logs to reconstruct session activity and examine filesystem interactions.

Mapped observed commands to relevant MITRE ATT&CK techniques, including system information discovery and file and directory discovery.

### 4. Credential Intelligence Analysis

Analyzed Cowrie authentication events using `jq`.

Investigated:

- Successful and failed login attempts.
- Username frequency.
- Password reuse across different usernames.
- Authentication outcomes.
- Source IP addresses.
- Authentication timelines.

Documented findings in a credential intelligence investigation report while excluding actual password values.

The current dataset was generated through controlled localhost testing, not external attacker activity.

## Planned Features

The following components are still under development or planned.

### 1. Python SSH Automation

- Learn Python fundamentals and SSH automation using Paramiko.
- Build a controlled Python script to connect to the local Cowrie honeypot.
- Automate a small set of authentication attempts using predefined test credentials.

### 2. Automated Reconnaissance

- Execute predefined reconnaissance commands through Python.
- Simulate system information gathering and file discovery.
- Generate repeatable SSH sessions for further investigation.

### 3. Automated Log Analysis

- Parse Cowrie JSON logs using Python.
- Extract authentication events and command activity.
- Identify repeated usernames, password reuse patterns, and suspicious command sequences.
- Generate investigation summaries.

### 4. Safe File Collection and Analysis

- Experiment with Cowrie's file capture functionality using harmless test files.
- Calculate SHA-256 hashes to identify and track collected samples.
- Examine file metadata and identify file types.
- Document findings without executing collected files.

## Tools and Technologies

| Category | Tools |
|---|---|
| Operating System | Kali Linux |
| Honeypot | Cowrie |
| Programming | Python (learning and planned automation) |
| SSH Automation | Paramiko (planned) |
| Log Analysis | jq, Cowrie JSON logs |
| Security Framework | MITRE ATT&CK |
| Version Control | Git, GitHub |

## Repository Structure

```text
SSH-Honeypot-Research-Lab/
│
├── investigations/
│   ├── session-004-file-discovery.md
│   ├── command-activity-analysis.md
│   └── credential-intelligence.md
│
├── honeypot-filesystem/
│   ├── etc/
│   │   ├── hostname
│   │   ├── passwd
│   │   └── northstar/
│   │       └── app.conf
│   │
│   ├── home/
│   │   ├── admin/
│   │   ├── analyst/
│   │   ├── backup/
│   │   └── deploy/
│   │
│   └── var/
│       └── backups/
│
├── configuration/
├── docs/
└── README.md
```

## Safety and Scope

This project is designed for controlled cybersecurity experimentation.

- SSH automation is intended to target only the local Cowrie instance (`127.0.0.1:2222`).
- Authentication testing uses a small, predefined set of fictional credentials.
- The simulated filesystem contains fictional information and synthetic data.
- Collected files will be analyzed safely without execution.
- Real credentials, authentication databases, runtime logs, and sensitive configuration files are excluded from the repository.

## Current Progress

This is an ongoing learning and research project. Implemented components are documented in the `investigations/` directory, while planned features will be added as development progresses.

The project is intended to strengthen my practical understanding of SSH security, honeypot deployment, threat investigation, credential intelligence, and Python-based security automation.
