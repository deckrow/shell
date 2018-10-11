#!/bin/bash

function app {
    clear

    echo "Available choice\n 1: access\n 2: sites\n\n 0: exit\n"
    read -p "Enter your choice: " choice

    if [ $choice = 1 ]; then
        listOfSites
    elif [ $choice = 2 ]; then
        goToSite
    else
        exit 0
    fi
}

function listOfSites {
    count=1
    str=""

    for file in ~/Documents/access/*
    do
        name=`basename $file`
        str="$str\n $count: $name"

        count=$(($count+1))
    done
     
    echo "All $1:"
    echo "$str\n\n b: back\n e: exit\n"

    showAccess $str
}

function backOrExit {
    echo "\nBack or exit?"
    echo " 1: back\n 2: exit\n"

    while [[ $choice != 1 || $choice != 2 ]]
    do
        read -p "Your choice: " choice

        case $choice in
            1) showAccess ;;
            2) exit 0 ;;
            *) echo "Incorrect choice. Try again" ;;
        esac
    done
}

function repeatedRequest {
    clear

    echo "Are you sure that you want to go to this directory?"
    echo " 1: Yes\n 2: No\n"

    while [[ $choice != 1 || $choice != 2 ]]
    do
        read -p "Your choice: " choice

        case $choice in
            1) break ;;
            2) goToSite ;;
            *) echo "Incorrect choice. Try again" ;;
        esac
    done
}

function showAccess {
    read -p "Enter your choice: " choice
    
    IFS=$'\n'
    for el in $str
    do
        cut -f : $el
        # if [ $el = $choice ]; then
        #     echo "we have this"
        # else
        #     echo "doesn't have"
        # fi

        #echo $str2
    done

    


    # while [ $choice != 0 ]
    # do
    #     read -p "Enter your choice: " choice
    #     echo ""

    #     case $choice in
    #         1) clear; cat $path/moscowremontnik.txt; backOrExit ;;
    #         2) clear; cat $path/glasspower.ru.txt; backOrExit ;;
    #         3) clear; cat $path/skinaliexpress.txt; backOrExit ;;
    #         4) clear; cat $path/frederiko.txt; backOrExit ;;
    #         5) clear; cat $path/rusremont-landing.txt; backOrExit ;;
    #         6) clear; cat $path/robo-remont.txt; backOrExit ;;
    #         b) app ;;
    #         e) exit 0 ;;
    #         *) echo "Incorrect choice. Try again" ;;
    #     esac
    # done
}

function goToSite {
    clear
    listOfSites sites

    alias path="/Applications/MAMP/htdocs"

    while [ $choice != 0 ]
    do
        read -p "Enter your choice: " choice
        echo ""

        case $choice in
            1) cd $path;;
            2) cd $path/moscowremontnik.info/glasspower;;
            3) cd $path/skinaliexpress.ru ;;
            4) cd $path/frederiko ;;
            5) cd $path/"русский-ремонт.рф" ;;
            6) cd $path/robo-remont.ru; backOrExit ;;
            9) app ;;
            0) exit 0 ;;
            *) echo "Incorrect choice. Try again" ;;
        esac

        cd "$(dirname $path)"
    done
}

app

