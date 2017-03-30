#!/bin/bash
set -e

ICOPROVIDER=`cat "$1" | ./find-ico.sh | ./validate-ico.sh | head -n 1`

if [ -z $ICOPROVIDER ]
then
	echo "I guess it is not an invoice"
	exit 1
fi

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

INVOICENUMBER=`grep -iE "fakt[uú]ra" "$1" | perl -p -e "s/$EUVATIDPROVIDER//;s/$ICOPROVIDER//;s/$DICPROVIDER//;s/$EUVATIDCUSTOMER//;s/$ICOCUSTOMER//;s/$DICCUSTOMER//;" | grep -o -E "(\d+/\d+)|\d{2,}" | head -n 1`

if [ -z "$INVOICENUMBER" ]
then
	INVOICENUMBER=`cat "$1" | perl -p -e "s/$EUVATIDPROVIDER//;s/$ICOPROVIDER//;s/$DICPROVIDER//;s/$EUVATIDCUSTOMER//;s/$ICOCUSTOMER//;s/$DICCUSTOMER//;" | grep -o -E "\d{2,}" | head -n 1`
fi

echo INVOICENUMBER=$INVOICENUMBER

VS=`grep -oi "Variabilný symbol.*" "$1" | perl -p -e "s/$EUVATIDPROVIDER//;s/$ICOPROVIDER//;s/$DICPROVIDER//;s/$EUVATIDCUSTOMER//;s/$ICOCUSTOMER//;s/$DICCUSTOMER//;" | grep -o -E "\d{2,}" | head -n 1`

if [ -z "$VS" ]
then
	VS=`grep -iEo "[^\w]VS:.*" "$1" | perl -p -e "s/$EUVATIDPROVIDER//;s/$ICOPROVIDER//;s/$DICPROVIDER//;s/$EUVATIDCUSTOMER//;s/$ICOCUSTOMER//;s/$DICCUSTOMER//;" | grep -o -E "\d{2,}" | head -n 1`
fi


#if [ -z "$VS" ]
#then
#	VS=$INVOICENUMBER
#fi

echo -n "VARIABLESYMBO=$VS"

if [ "$INVOICENUMBER" = "$VS" ]
then
	echo " ok "
else
	echo " !!! "
fi

DATEINVOICE=`grep -iE "Dátum (vystavenia|vyhotovenia)" "$1" | grep -oE "\d{2}\.\d{1,2}\.20\d{2}" | head -n 1`
DATEPROVIDED=`grep -iE "Dátum dodania" "$1" | grep -oE "\d{2}\.\d{1,2}\.20\d{2}" | head -n 1`
DATEPAYMENT=`grep -iE "splatnos" "$1" | grep -oE "\d{2}\.\d{1,2}\.20\d{2}" | head -n 1`

echo DATEINVOICE=$DATEINVOICE
echo DATEPROVIDED=$DATEPROVIDED
echo DATEPAYMENT=$DATEPAYMENT

#grep -E "^.*\d{2}\.\d{1,2}\.20\d{2}" "$1"

SUM=`grep -iE "EUR|€" "$1" | grep -vE "\d{2}\.\d{1,2}\.20\d{2}" | ./find-money.pl | sort -gr | head -n 1`
if [ -z "$SUM" ]
then
	SUM=`cat "$1" | grep -vE "\d{2}\.\d{1,2}\.20\d{2}" | ./find-money.pl | sort -gr | head -n 1`

fi




echo SUM=$SUM

#echo "insert into faktury values"
