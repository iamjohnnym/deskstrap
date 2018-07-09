backup_file () {
    FILE_NAME=${1}
    if [ -f "/Users/$(whoami)/.${FILENAME}" ] ; then
        mv ~/.${FILE_NAME}{,.bak}
    fi
}

copy_file () {
    SOURCE_DIR=${1}
    FILE_NAME=${2}
    cp ./${SOURCE_DIR}/${FILE_NAME} ~/.${FILE_NAME}
}

backup_and_copy () {
    FILE_LIST=${1}
    SOURCE_DIR=${2}
    for FILE_NAME in ${FILE_LIST} ; do
        backup_file ${FILE_NAME}
        copy_file ${SOURCE_DIR} ${FILE_NAME}
    done
}
