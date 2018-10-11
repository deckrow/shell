function fileTour {
    for file in $1/*; do
        local name=`basename $file`
        local count=$2
        local cyan='\033[01;36m'
        local bold='\033[1m'
        local nc='\033[0m'

        if [ -d $1/$name ]; then
            echo "$2 ${cyan}${bold}$name${nc}"
            fileTour $1/$name "$2\t"
        else
            echo "$2 $name"
        fi       
    done
}

function checkPath {
    echo "Enter your path:"

    while read path; do
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