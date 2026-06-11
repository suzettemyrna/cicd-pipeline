## Part 6. Уведомления в Telegram

> English version: [Part6.md](../eng/Part6.md)

## 6.1. Создание Telegram-бота

Создадим бота через Telegram-бота `BotFather`.

Для этого отправим команду:

```text
/newbot
```

После этого зададим отображаемое имя (name) и уникальное имя пользователя (username) для бота.

В ответ `BotFather` выдаст токен, который потребуется для отправки уведомлений.

![BotFather](../../images/part6/1.png)

---

## 6.2. Получение идентификатора чата

Найдём созданного бота в Telegram и отправим ему любое сообщение.

![Telegram bot](../../images/part6/2.png)

После этого откроем страницу:

```text
https://api.telegram.org/bot<TOKEN>/getUpdates
```

где `<TOKEN>` — токен, полученный при создании бота.

В ответе найдём значение `chat.id`, которое потребуется для отправки уведомлений.

![getUpdates](../../images/part6/3.png)

---

## 6.3. Создание скрипта уведомлений

Создадим скрипт:

```text
src/scripts/notify_tg.sh
```

Скрипт формирует сообщение на основе переменных окружения GitLab CI и отправляет его через Telegram Bot API.

![notify script](../../images/part6/4.png)

> Файл скрипта: [/src/scripts/notify_tg.sh](../../src/scripts/notify_tg.sh)

---

## 6.4. Добавление уведомлений в pipeline

Подключим вызов скрипта после выполнения каждого этапа с помощью секции `after_script`.

Файл `.gitlab-ci.yml`:

![gitlab-ci.yml](../../images/part6/5.png)

> Файл `.gitlab-ci.yml`, использованный в этой части: [/src/history/Part6/.gitlab-ci.yml](../../src/gitlab-ci.yml/final/.gitlab-ci.yml)

---

## 6.5. Проверка работы уведомлений

После запуска пайплайна бот начинает получать уведомления о выполнении этапов CI/CD.

![telegram notifications](../../images/part6/6.png)

---

## Итог

Настроены уведомления GitLab CI/CD через Telegram-бота с отправкой информации о статусе выполнения этапов пайплайна.

---

## Навигация

↑ [README_ru](../../README_ru.md)

← [Part 5. Этап деплоя](Part5_ru.md)

---