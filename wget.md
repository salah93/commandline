# wget

## download files from sites
```
wget https://example.com/abc.txt
# save to different file name
wget -O xyz.txt https://example.com/abc.txt
# recursive, accept only certain file extensions
wget -r -A.pdf https://example.com/pdfs
# copy site to local machine
wget --mirror -p --convert-links https://example.com
# -p download all files necessary to display html page
# --convert-links: convert links for local viewing
```


## examples
```
# download all txt pdf files for a class
# shoutout to to professor walfish
wget -r -A.txt,.pdf -P  os https://cs.nyu.edu/~mwalfish/classes/15sp/
```
