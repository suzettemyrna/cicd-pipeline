# Part 5. Deployment Stage

> Russian version: [Part5_ru.md](../ru/Part5_ru.md)

## 5.1. Preparing the Target Machine

Create a second virtual machine with `Ubuntu Server 22.04 LTS` for application deployment.

![Ubuntu Server 22.04](../../images/part5/1.png)

---

## 5.2. Configuring Network Connectivity Between Virtual Machines

To establish communication between the virtual machines, configure a VirtualBox Internal Network.

![internal network](../../images/part5/2.png)

Configuration of the first machine (CI/CD server):

![netplan 1](../../images/part5/3.png)

Configuration of the second machine (target server):

![netplan 2](../../images/part5/4.png)

After modifying the configuration, apply the changes:

```bash
sudo netplan apply
```

Verify connectivity between the machines:

![ip a](../../images/part5/5.png)

![ping](../../images/part5/6.png)

---

## 5.3. Configuring SSH Access

1. Install the SSH server on both machines, start the service, and verify its status:

```bash
sudo apt install openssh-server
sudo systemctl start ssh
systemctl status ssh
```

![ssh status](../../images/part5/7.png)

Enable automatic startup of the SSH service:

```bash
sudo systemctl enable ssh
```

2. On the second virtual machine, modify the SSH server configuration file:

```text
/etc/ssh/sshd_config
```

Configure the following settings:

* enable port `22`;
* allow `root` login (for the laboratory environment);
* enable password authentication.

![sshd config 1](../../images/part5/8.png)

![sshd config 2](../../images/part5/9.png)

Restart the SSH service:

```bash
sudo systemctl restart ssh
```

3. On the first machine, grant the `gitlab-runner` user permission to execute commands without a password:

```bash
sudo visudo
```

Add the following line:

```text
gitlab-runner ALL=(ALL) NOPASSWD: ALL
```

Switch to the `gitlab-runner` user:

```bash
sudo su gitlab-runner
```

4. Generate an SSH key pair on the first machine:

```bash
ssh-keygen
```

Add the public key to the second machine:

```text
~/.ssh/authorized_keys
```

![authorized\_keys](../../images/part5/10.png)

5. Verify the connection from the first machine:

```bash
ssh user@192.168.1.2
```

![ssh connection](../../images/part5/11.png)

---

## 5.4. Configuring the CD Stage

Add a `deploy` stage to the `.gitlab-ci.yml` file. The stage should be executed manually after all previous pipeline stages complete successfully.

To make the stage manual, add the following directive:

```yaml
when: manual
```

`.gitlab-ci.yml`:

![gitlab-ci.yml](../../images/part5/12.png)

> `.gitlab-ci.yml` used in this part: [/src/history/Part5/.gitlab-ci.yml](../../src/gitlab-ci.yml/history/Part5/.gitlab-ci.yml)

---

## 5.5. Deployment Script

Create a `deploy.sh` script that copies build artifacts to the target machine using `ssh` and `scp`.

![deploy script](../../images/part5/13.png)

> Script file: [/src/scripts/deploy.sh](../../src/scripts/deploy.sh)

---

## 5.6. Running the Deployment

Run the `deploy` stage and verify that the artifacts have been successfully copied to the target machine.

![deploy success 1](../../images/part5/14.png)

![deploy success 2](../../images/part5/15.png)

![deploy success 3](../../images/part5/16.png)

To allow artifact placement on the second machine, change ownership of `/usr/local/bin` for user `user`:

```bash
sudo chown user:user /usr/local/bin
```

After that, the artifacts are successfully copied to the `/usr/local/bin` directory on the target machine:

![final artifacts 1](../../images/part5/17.png)

![final artifacts 2](../../images/part5/18.png)

---

## Summary

A deployment stage was configured to transfer build artifacts to a remote virtual machine over SSH.

---

## Navigation

↑ [README](../../README.md)

← [Part 4. Tests](Part4.md)

→ [Part 6. Telegram Notifications](Part6.md)

---