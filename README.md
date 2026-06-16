# CI/CD Pipeline

> Russian version: [README_ru.md](README_ru.md)

A practical laboratory project focused on continuous integration and continuous delivery.

The project covers setting up a custom GitLab Runner, creating a CI/CD pipeline for a C application, performing automated builds, code style checks, integration testing, deployment to a remote virtual machine, and sending pipeline execution notifications.

All tasks are performed using GitLab CI/CD and Linux command-line tools without graphical interfaces.

## Project Topics

* GitLab Runner
* GitLab CI/CD
* `.gitlab-ci.yml`
* automated project builds
* build artifacts
* `clang-format`
* integration testing
* SSH and SCP
* automated deployment
* Telegram notifications

## Learning Outcomes

After completing the project, the user will be able to:

* install and register GitLab Runner;
* create multi-stage CI/CD pipelines;
* automate application builds;
* store and use build artifacts;
* perform automated code style checks;
* run integration tests within a pipeline;
* automate deployment to a remote server;
* configure pipeline execution notifications.

## Project Structure

* [Part 1](docs/eng/Part1.md) — GitLab Runner Setup
* [Part 2](docs/eng/Part2.md) — Project Build and Artifacts
* [Part 3](docs/eng/Part3.md) — Code Style Checks
* [Part 4](docs/eng/Part4.md) — Test Execution
* [Part 5](docs/eng/Part5.md) — Automated Deployment
* [Part 6](docs/eng/Part6.md) — Telegram Notifications

## Quick Start

The following components are required to complete the laboratory tasks:

* VirtualBox or another virtualization platform;
* two virtual machines running Ubuntu Server 22.04 LTS;
* GitLab Runner;
* access to a GitLab project;
* root/sudo privileges;
* SSH connectivity between virtual machines.

It is recommended to complete the laboratory tasks sequentially, starting with [Part 1](docs/eng/Part1.md).

## Repository Structure

```text
.
├── docs/           # Main documentation
│   ├── ru/
│   └── eng/
├── images/         # Screenshots and diagrams
├── src/            # CI/CD configuration and helper scripts
├── README_ru.md    # Project overview (Russian version)
└── README.md       # Project overview (English version)
```

## Tools Used

* GitLab CI/CD
* GitLab Runner
* Bash
* Make
* GCC
* clang-format
* OpenSSH
* SCP
* Telegram Bot API
* Ubuntu Server
* VirtualBox
