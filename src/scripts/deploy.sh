#! /bin/bash

scp src/cat/s21_cat user@192.168.1.2:/usr/local/bin
scp src/grep/s21_grep user@192.168.1.2:/usr/local/bin

# Verify that the files were copied successfully
ssh user@192.168.1.2 ls -ah /usr/local/bin/
