#!/bin/sh


read -n 5 -r -p "Press 'yes' to continue... : " key

if [ "$key" = 'yes' ] || [ "$key" = 'y' ]; then
    echo "continue"
else
    echo "stop"
fi