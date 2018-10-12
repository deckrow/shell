#!/bin/bash
# путь к bash

# alias path="/Applications/MAMP/htdocs"
# $path

# $0 - имя скрипта, $1 - параметры, 
#$# - кол-во параметров, 
#${!#} - последний параметр
#$* - все параметры одним элем. $* = '1, 2, 3'
#$@ - как массив $@ = [1, 2, 3]
#IFS=$'\n' - параметр по переносу

#read doing #считывание ввода в переменную
#read '' # записывается в переменную REPLY
#read -s скрытие ввода, -t 5 время ожидания

# case $doing in # case конструкция
#     1) date ;;
#     2) time ;;
#     3) exit 0 ;;
#     *) echo 'Введен неверный символ'
# esac

# -----

# echo 'Enter your directory:'

# read directory

# for file in $directory/*
#     do
#         if [ -d $file ]; then
#             echo "$file is a directory"
#         elif [ -f $file ]; then
#             echo "$file is a file"
#         fi
#     done

# считывание файла и вывод на консоль -----

# count=1
# cat file.txt | while read line
# do
#     echo "Line $count: $line"
#     count=$(( $count + 1 ))
# done
# echo "Finished"

# запись в файл -----

# pwd >> somefile.txt

# ls -l xfile 2>file # сообщение об ошибке запишется в файл
# ls –l myfile xfile anotherfile 2>errorcontent 1>correctcontent #и ошибка и не ошибка запишется в один файл (&> и 1 и 2)

# exec 1>output
# echo 'somestr' #вывод всего в файл

# 0<file #считывание с файла

# Выполнение скрипта в фоне sh script.sh &
# nohup sh script.sh & будет выполнятся при закрытии терминала и данные запишет в nohup.out

# trap "echo ' Trapped Ctrl-C'" SIGINT #trap - отслеживание каких либо сигнало (SIGNINT - Сtrl+C)
# echo This is a test script
# count=1
# while [ $count -le 10 ]
# do
#     echo "Loop #$count"
#     sleep 1
#     count=$(( $count + 1 ))
# done

# new comment