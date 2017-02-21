# crontab

## see listed jobs 
`crontab -l`


## edit jobs
`crontab -e`


within the file, write out scheduled jobs in this format

```
* * * * * /path/to/bin/script.sh
```

The first five fields represent the following:

+ Minutes (0-59)
+ Hour (0-23)
+ day of month (1-31)
+ Month (1-12)
+ Weekday (0-6)

The last field is the script to be run, **without quotation marks**


## symbols
A "*" represents "every"

## keywords
```
@reboot     Run once, at startup
@yearly     Run once  a year     "0 0 1 1 *"
@annually   (same as  @yearly)
@monthly    Run once  a month    "0 0 1 * *"
@weekly     Run once  a week     "0 0 * * 0"
@daily      Run once  a day      "0 0 * * *"
@midnight   (same as  @daily)
@hourly     Run once  an hour    "0 * * * *"


@daily /bin/execute/this/script.sh
```


## comma-separated
```
0,10,20,30,40,50 * * * * /bin/execute/this/script.sh
*/10 * * * * /bin/execute/this/script.sh
```


## redirect output
```
*/10 * * * * /bin/execute/this/script.sh >> /var/log/script_output.log 2>&1
```
