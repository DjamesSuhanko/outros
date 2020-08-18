#!/bin/bash

MY_HOSTNAME_IS=`hostname -s`

TARGET_HOST="spi000"

TARGET_SRV="lab"

IS_IT=`echo $MY_HOSTNAME_IS|egrep -i $TARGET_HOST|wc -c`

[ $# -gt 0 ] ||{
    [ $IS_IT -gt 0 ] || exit 0
}

[ $# -gt 0 ] &&{
    if [ ! "$1" = "pass" ]; then
        echo "O parametros deve ser: pass"
        echo "Saindo..."
        exit
    fi
}

source ./$TARGET_SRV/$TARGET_SRV.sh
