## tar
Compressing files with tar is simple

```bash
# compress
tar cvfz compressed.tar.gz directory_to_compress/
# uncompress
tar xvfz compressed.tar.gz
```

argument | what it does
--- | ---
c | create new archive
z | compress/uncompress with gzip
j | compress/uncompress with bzip
v | list files to standard output that are handled
f | after this argument is the archive file name
x | extract a `.tar` file


Note that v is optional, and that "z" can be replaced with "j"


## reference
[geekstuff](http://www.thegeekstuff.com/2010/04/unix-tar-command-examples)


## Python
The `shutil` module provides shell utilities

```python
import shutil
shutil.make_archive('compressed_name', 'gztar', base_dir='directory_to_compress' )
```
