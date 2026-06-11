# Part 1. Настройка GitLab Runner

> English version: [Part1.md](../eng/Part1.md)

## 1.1. Подготовка виртуальной машины

Для выполнения проекта была создана виртуальная машина с `Ubuntu Server 22.04 LTS`.

![Ubuntu Server 22.04](../../images/part1/1.png)

---

## 1.2. Установка GitLab Runner

> Скрипт для установки GitLab Runner: [src/scripts/install_gitlabrunner.sh](../../src/scripts/install_gitlabrunner.sh)

Скрипт выполняет следующие действия:

* подключает официальный репозиторий GitLab Runner;
* устанавливает пакет `gitlab-runner`;
* запускает регистрацию раннера;
* запускает сервис GitLab Runner;
* проверяет его состояние.

Запустим скрипт:

```bash
bash install_gitlabrunner.sh
```

---

## 1.3. Регистрация GitLab Runner

После установки GitLab Runner необходимо зарегистрировать его для работы с проектом.

Во время регистрации потребуется указать:

* URL GitLab-инстанса;
* registration token проекта;
* описание раннера;
* тип исполнителя (*executor*).

В качестве описания был указан:

```text
DO6_CICD
```

В качестве исполнителя выбран:

```text
shell
```

Процесс регистрации показан на скриншоте ниже.

![Регистрация GitLab Runner](../../images/part1/2.png)

---

## Итог

На виртуальной машине установлен и запущен GitLab Runner, зарегистрированный для проекта DO6_CICD с использованием shell executor.

---