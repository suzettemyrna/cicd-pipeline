# Part 2. Build

> Russian version: [Part2_ru.md](../ru/Part2_ru.md)

## 2.1. Preparing the Environment

Configure SSH access for working with the repositories.

Generate an SSH key pair:

```bash
ssh-keygen
```

Set the required permissions:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
```

Configure Git user information:

```bash
git config --global user.name "<nickname>"
git config --global user.email "<email>"
```

After that, clone the CI/CD project repository and the test application repository.

> Repository cloning script: [/src/scripts/clone_projects.sh](../../src/scripts/clone_projects.sh)

---

## 2.2. Configuring the Build Stage

Create the following file:

```text
src/.gitlab-ci.yml
```

At this stage, the pipeline consists of a single build stage.

`.gitlab-ci.yml`:

![gitlab-ci.yml](../../images/part2/1.png)

The job performs:

* building the `s21_cat` application;
* building the `s21_grep` application;
* storing the generated executables as artifacts;
* keeping artifacts for 30 days.

> `.gitlab-ci.yml` used in this part: [/src/history/Part2/.gitlab-ci.yml](../../src/gitlab-ci.yml/history/Part2/.gitlab-ci.yml)

---

## 2.3. Running the Pipeline

After committing the changes, GitLab automatically starts the pipeline.

![Pipeline success](../../images/part2/2.png)

![Pipeline success](../../images/part2/3.png)

---

## Summary

A GitLab CI build stage was configured to build the applications via Makefiles and store the resulting executables as artifacts for 30 days.

---
