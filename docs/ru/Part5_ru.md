## Part 5. Этап деплоя

> English version: [Part5.md](../eng/Part5.md)

## 5.1. Подготовка инфраструктуры

Развёрнута вторая виртуальная машина с `Ubuntu Server 22.04 LTS`.

![Ubuntu Server 22.04](../../images/part5/1.png)

---

## 5.2. Настройка сети между виртуальными машинами

Для организации связи между машинами настроим внутреннюю сеть VirtualBox:

1. Остановим виртуальные машины и добавим сетевой адаптер *Внутренняя сеть*:

![network adapter](../../images/part5/2.png)

2. На обеих машинах настроим конфигурации `netplan`:

* первая машина (CI/CD сервер):

![netplan 1](../../images/part5/3.png)

* вторая машина (target-сервер):

![netplan 2](../../images/part5/4.png)

Применяем конфигурацию:

```bash
sudo netplan apply
```

3. Проверим связность:

На обеих машинах:

```bash
ip a
ping -c 5 <IP-адрес другой машины>
```

![ip a](../../images/part5/5.png)
![ping](../../images/part5/6.png)

---

## 5.3. Настройка SSH-доступа без пароля

1. На обе машины установим SSH-сервер, запустим его и проверим его статус:

```bash
sudo apt install openssh-server
sudo systemctl start ssh
systemctl status ssh
```

![ssh status](../../images/part5/7.png)

Установим автоматический запуск SSH-сервера при загрузке системы:

```bash
sudo systemctl enable ssh
```

2. На второй машине изменим файл `/etc/ssh/sshd_config`:

* включим порт `22`
* разрешим root-доступ (для лабораторной среды)
* включим аутентификацию по паролю

![sshd config 1](../../images/part5/8.png)
![sshd config 2](../../images/part5/9.png)

Перезапустим SSH:

```bash
sudo systemctl restart ssh
```

3. На первой машине выдадим пользователю `gitlab-runner` права на выполнение команд без пароля:

```bash
sudo visudo
```

Добавим строку:

```text
gitlab-runner ALL=(ALL) NOPASSWD: ALL
```

Переключимся на пользователя `gitlab runner`:

```bash
sudo su gitlab-runner
```

4. На первой машине сгенерируем пару SSH-ключей:

```bash
ssh-keygen
```

Публичный ключ добавим на вторую машину в:

```text
~/.ssh/authorized_keys
```

![authorized\_keys](../../images/part5/10.png)

5. С первой машины проверим подключение:

```bash
ssh user@192.168.1.2
```

![ssh connection](../../images/part5/11.png)

---

## 5.4. Настройка CD-этапа

Добавим в pipeline этап деплоя с выполнением вручную:

```yaml
when: manual
```

Файл `.gitlab-ci.yml`:

![gitlab-ci.yml](../../images/part5/12.png)

> Файл `.gitlab-ci.yml`, использованный в этой части: [/src/history/Part4/.gitlab-ci.yml](../../src/gitlab-ci.yml/history/Part5/.gitlab-ci.yml)

---

## 5.5. Скрипт деплоя

Реализован bash-скрипт, выполняющий передачу артефактов на вторую виртуальную машину через `ssh` и `scp`.

![deploy script](../../images/part5/13.png)

> Файл скрипта: [/src/scripts/deploy.sh](../../src/scripts/deploy.sh)

---

## 5.6. Результат выполнения деплоя

CD-этап запускается вручную и успешно выполняется:

![deploy success 1](../../images/part5/14.png)
![deploy success 2](../../images/part5/15.png)
![deploy success 3](../../images/part5/16.png)

Чтобы разместить артефакты на второй машине, изменим права на `/usr/local/bin` для её пользователя `user`:

```bash
sudo chown user:user /usr/local/bin
```

После этого артефакты успешно размещаются на целевой машине:

![final artifacts 1](../../images/part5/17.png)
![final artifacts 2](../../images/part5/18.png)

---

## Итог

Настроена инфраструктура из двух виртуальных машин, организован SSH-доступ без пароля и реализован CD-этап, выполняющий ручной деплой артефактов на удалённую машину.

---