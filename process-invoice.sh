#!/bin/bash

ICOPROVIDER=`cat "$1" | ./find-ico.sh | ./validate-ico.sh | head -n 1`
ICOCUSTOMER=`cat "$1" | sed -e "s/$ICOPROVIDER//" | ./find-ico.sh | ./validate-ico.sh | head -n 1`

echo ICOPROVIDER=$ICOPROVIDER
echo ICOCUSTOMER=$ICOCUSTOMER

DICPROVIDER=`cat "$1" | ./find-dic.sh | ./validate-dic.sh | head -n 1`
DICCUSTOMER=`cat "$1" | sed -e "s/$DICPROVIDER//" | ./find-dic.sh | ./validate-dic.sh | head -n 1`

echo DICPROVIDER=$DICPROVIDER
echo DICCUSTOMER=$DICCUSTOMER

EUVATIDPROVIDER=`cat "$1" | ./find-euvatid.sh | ./validate-euvatid.sh | head -n 1`
EUVATIDCUSTOMER=`cat "$1" | sed -e "s/$EUVATIDPROVIDER//" | ./find-euvatid.sh | ./validate-euvatid.sh | head -n 1`

echo EUVATIDPROVIDER=$EUVATIDPROVIDER
echo EUVATIDCUSTOMER=$EUVATIDCUSTOMER

INVOICENUMBER=`cat "$1" | sed -e "s/$EUVATIDPROVIDER//;s/$ICOPROVIDER//;s/$DICPROVIDER//;s/$EUVATIDCUSTOMER//;s/$ICOCUSTOMER//;s/$DICCUSTOMER//;" | grep -o -E "\d+" | head -n 1`

echo INVOICENUMBER=$INVOICENUMBER

SUM=`grep -iE "EUR|€" "$1" | grep -o -wE "\d+[,.]\d\d" | sort -gr | head -n 1`





echo SUM=$SUM

