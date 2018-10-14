cyan='\033[01;36m'
bold='\033[1m'
nc='\033[0m'

function fileTour {
    for file in $1/*; 
    do
        local name=`basename $file`

        if [ -d $1/$name ]; then
            echo "$2 ${cyan}${bold}$name${nc}"
            fileTour $file "$2\t"
        else
            echo "$2 $name"
        fi       
    done
}

function checkPath {
    while read -p "Enter your path: " path; 
    do
        if ! [ -d $path ]; then
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
    fileTour $donePath "\t"
}

app