## Part 3. Тест кодстайла

> English version: [Part3.md](../eng/Part3.md)

## 3.1. Настройка проверки кодстайла

Для выполнения проверки необходимо установить `clang-format` на виртуальную машину:

```bash
sudo apt install clang-format
```

Добавим в файл `.gitlab-ci.yml` этап проверки кодстайла.

На этом этапе выполняется проверка исходного кода проектов `s21_cat` и `s21_grep` на соответствие стилю Google C Style.

Для форматирования используется конфигурация `.clang-format`, основанная на стиле Google.

Файл `.gitlab-ci.yml`:

![gitlab-ci.yml](../../images/part3/1.png)

> Файл `.gitlab-ci.yml`, использованный в этой части: [/src/history/Part3/.gitlab-ci.yml](../../src/gitlab-ci.yml/history/Part3/.gitlab-ci.yml)

> Конфигурация `.clang-format`:[/src/.clang-format](../../src/.clang-format)

---

## 3.2. Проверка работы пайплайна

После коммита изменений GitLab автоматически запускает этап проверки стиля.

Успешное прохождение проверки:

![Style check success](../../images/part3/2.png)

![Style check success](../../images/part3/3.png)

Пример ошибки форматирования, приводящей к остановке пайплайна:

![Style check failed](../../images/part3/4.png)

---

## Итог

В пайплайн добавлен этап проверки кодстайла с использованием `clang-format`. При обнаружении нарушений форматирования выполнение пайплайна завершается с ошибкой.

---