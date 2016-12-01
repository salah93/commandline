# sed

## replacing text
```
$ cat hello.txt
i love pie do you love pie
$ sed -e 's/pie/apples/' hello.txt
i love apples do you love pie
$ # global replace
$ cat hello.txt
i love pie do you love pie
$ sed -e 's/pie/apples/g' hello.txt
i love apples do you love apples
```
