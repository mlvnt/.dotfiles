
xscp() {
    #
    # xscp <file> <destination>
    #
    # scp the file to user@host:directory
    # Directory is ~/ by default.

    local USER="richardz";
    local HOST="unix.andrew.cmu.edu";

    if [ $1 == "-r" ]
    then
        local FLAG="-r";
        local FILE=$2;
        local DIR=$3;
    else
        local FLAG="";
        local FILE=$1;
        local DIR=$2;
    fi;

    if [ -z $DIR ]
    then
        local DIR="~/";
    fi;

    scp $FLAG $FILE $USER@$HOST:$DIR;
}

