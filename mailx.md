## mailx

## step1: create certificates
```
mkdir ~/.certs
certutil -N -d ~/.certs
echo -n | openssl s_client -connect smtp.gmail.com:465 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ~/.certs/gmail.crt
certutil -A -n "Google Internet Authority" -t "C,," -d ~/.certs -i ~/.certs/gmail.crt
```

## step2: create password for your app to use via gmail
+ setup app password for gmail account [here](https://security.google.com/settings/security/apppasswords)

## step3 append following to /etc/mail.rc

+ assume
    + name: joe
    + email: joe@email.com
    + password: 123456

```
account gmail {
    set smtp-use-starttls
    set ssl-verify=ignore
    set smtp-auth=login
    set smtp=smtp://smtp.gmail.com:587
    set smtp-auth-user=joe@email.com
    set smtp-auth-password=123456
    set from="joe@email.com(joe)"
    set ssl-verify=ignore
    set nss-config-dir=/path/to/certs
}
```


## step4 test
`echo 'mail body text' | mail -A gmail -s 'subject line' recipients_email@email.com`
