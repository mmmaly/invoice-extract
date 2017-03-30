#!/bin/bash
sed -e "s/  /\t/g;s/ //g;s/,/./g" < "$1" > spaces/"$1" 

