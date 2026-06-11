## Part 4. Тесты

> English version: [Part4.md](../eng/Part4.md)

## 4.1. Настройка этапа тестирования

Добавим в CI-пайплайн этап запуска интеграционных тестов для проектов `s21_cat` и `s21_grep`.

Этап выполняется только после успешного завершения сборки и проверки кодстайла.

Файл `.gitlab-ci.yml`:

![gitlab-ci.yml](../../images/part4/1.png)

> Файл `.gitlab-ci.yml`, использованный в этой части: [/src/history/Part4/.gitlab-ci.yml](../../src/gitlab-ci.yml/history/Part4/.gitlab-ci.yml)

---

## 4.2. Результаты выполнения пайплайна

При наличии ошибок в тестах этап завершается с ошибкой:

![tests failed](../../images/part4/2.png)

![tests failed](../../images/part4/3.png)

При провале предыдущих этапов выполнение тестов не запускается из-за заданного порядка стадий пайплайна:

![pipeline blocked](../../images/part4/4.png)

---

## 4.3. Настройка тестового окружения

Для корректного выполнения тестов в CI были приведены к совместимому виду Makefile в проектах `s21_cat` и `s21_grep`.

![makefile change 1](../../images/part4/5.png)
![makefile change 2](../../images/part4/6.png)

> `Makefile` проектов: [/src/makefiles/](../../src/makefiles/)

Успешное прохождения всех этапов pipeline:

![tests success](../../images/part4/7.png)
![tests success](../../images/part4/8.png)

---

## Итог

Добавлен этап тестов в CI-пайплайн с зависимостью от сборки и проверки кодстайла.

---

## Навигация

↑ [README_ru](../../README_ru.md)

← [Part 3. Тест кодстайла](Part3_ru.md)

→ [Part 5. Этап деплоя](Part5_ru.md)

---