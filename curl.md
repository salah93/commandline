[source](https://curl.haxx.se/docs/httpscripting.html)

## GET
```
curl https://example.com
```

## HEAD
```
curl -I https://example.com
curl --head https://example.com
```

## POST
```
curl --data name=salah https://example.com
curl -d name=salah https://example.com
# you must url encode data or use:
curl --data-urlencode "name=I am Salah" https://www.example.com
```

## first send a POST and then a GET:
```
curl -d score=10 -d name=salah http://example.com/post.cgi --next http://example.com/results.html
```

## file uploads
```
curl --form upload=@localfilename http://example.com/post.cgi
```

## user agent
```
# To make curl look like Internet Explorer 5 on a Windows 2000 box:
curl --user-agent "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)" [URL]
# Or why not look like you're using Netscape 4.73 on an old Linux box:
curl --user-agent "Mozilla/4.73 [en] (X11; U; Linux 2.2.15 i686)" [URL]
```


## Issues
+ for forms do we need to send submit button?


## Tests
### POST
+ upload file to server
+ test difference between --form, --data, and --data-urlencode
