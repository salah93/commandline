## mailx

## step1: use mozilla firefox's certificates

## step2: create password for your app to use via gmail

## step3 append following to /etc/mail.rc

```
account gmail {
set smtp-use-starttls
set ssl-verify=ignore
set smtp-auth=login
set smtp=smtp://smtp.gmail.com:587
set from="salah.ahmed.hslc@gmail.com(salah)"
set smtp-auth-user=**youremail**
set smtp-auth-password=**yourpassword**
set ssl-verify=ignore
set nss-config-dir=/path/to/certs
}
```


## step4 test
`echo 'mail body text' | mail -A gmail -s 'subject line' recipients_email@email.com`
