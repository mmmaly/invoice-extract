#grep -o -h -E -w "(^|[^0-9])\d{8}($|[^0-9])" *.txt
grep -o -h -E -w "\d{8}" *.txt
