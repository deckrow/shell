cyan='\033[01;36m'
green='\033[01;32m'
bold='\033[1m'
nc='\033[0m'

function fileTour {
    for file in $1/*; do
        local name=$file

        if [ -d $file ]; then
            fileTour $file
        else
            checkFile $file
        fi       
    done
}

function checkFile {
    local filePath=$1

    if [[ $selectedAction == 1 ]]; then
        local result=$(sed -n "/${expression}/=" $filePath)

        if ! [[ -z $result ]]; then
            echo "path: ${cyan}${bold}$filePath${nc}, lines:" ${green}$result${nc} ";"
        fi
    elif [[ $selectedAction == 2 ]]; then
        sed -i '' "s/${expression}/${newExpression}/g" $filePath
    else
        sed -i '' "/${expression}/d" $filePath
    fi
}

function checkExpression {
    while read -p "Enter your $1: " exp; do
        if [[ $exp ]]; then
            if [[ $1 == "expression" ]]; then
                expression=$exp
            else
                newExpression=$exp
            fi

            break
        else
            echo "Enter something!"
        fi
    done
}

function actionChoice {
    echo "\nWhat do you want to do?\n"
    echo "1. find text\n2. replace text\n3. delete text\n\n0. exit\n"

    while [[ $choice != 1 || $choice != 2 || $choice != 3 ]]
    do
        read -p "Enter your choice: " choice

        case $choice in
            1) selectedAction=1; checkExpression "expression"; break;;
            2) selectedAction=2; checkExpression "expression"; checkExpression "new expression"; break;;
            3) selectedAction=3; checkExpression "expression"; break;;
            0) exit;;
            *) echo "Incorrect choice. Please try again!" ;;
        esac
    done
}

function checkPath {
    while read -p "Enter your path: " path; do
        if ! [[ -d $path ]]; then
            echo "\"$path\" doesn't exist!"
        else
            donePath=$path
            break
        fi
    done
}

function app {
    clear
    checkPath
    actionChoice
    fileTour $donePath
}

app