# Todo list.

```
located           # configs (current behavior)
located -archive  # .tar, .gz, .zip, .bz2, .xz, .7z
located -logs     # /var/log/* and other log locations
located -service  # systemd service files
located -cron     # crontabs, /etc/cron.*
located -cert     # SSL/TLS certificates (.pem, .crt, .key)
located -backup   # .bak, .old, backup dirs
```

Each mode could have its own priority list and search paths. Like: *located -logs* could prioritize:

```
/var/log/syslog
/var/log/apache2/error.log
/var/log/auth.log
/var/log/mysql/error.log
```

# Other ideas

```
located -size +100M      # files larger than 100M
located -size -10M       # files smaller than 10M
located -size 50M-200M   # files between 50M and 200M
```

We could combine it with the other modes too:

```
located -logs -size +100M     # big log files eating disk space
located -archive -size +1G    # large archives
located -all -size +500M      # any large config/system files
```