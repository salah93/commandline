# awk

## print lines of file
```
$ cat <<EOF >> food.txt
i love pie
i hate apples
i love chicken
i hate salmon
EOF
$ awk '/love/ {print $3}' food.txt
pie
chicken
$ # -F argument changes the delimiter or field seperator (default is space)
$ cat <<EOF >> food2.csv
feeling,food
love,pie
hate,salmon
love,chicken
hate,apples
EOF
$ awk -F ',' '/love/ {print $2}' food2.csv
pie
chicken
```

## pattern
`awk '/pattern/ {actions }'`

## universal pattern
`awk ' {actions}'`

## begin/end
+ you can do some actions before any line is read or after all lines are read
```
awk 'BEGIN {actions}'
awk 'END {actions}'
```

## printing
+ `$0` signifies entire line
+ `$x` signifies item number x for the number of items seperated by the delimiter
