# Todo list.

```
located -archive | -archives  	# .tar, .gz, .zip, .bz2, .xz, .7z
located -logs    | -log 		# /var/log/* and other log locations
located -error   | -errors 		# /var/log/error.log and all other error logs. (also scan all vhosts!)
located -service | -services 	# systemd service files
located -cron    | -crontabs 	# crontabs, /etc/cron.*
located -cert    | -certs  		# SSL/TLS certificates (.pem, .crt, .key)
located -backup  | -backups		# .bak, .old, backup dirs
located -journal -n 100 		# quick journalctl wrapper
```

Each mode could have its own priority list and search paths. Like: *located -logs* could prioritize:

```
/var/log/syslog
/var/log/apache2/error.log
/var/log/auth.log
/var/log/mysql/error.log
```

# Other ideas

Versioning. 

Often it's `service -v`, then `--version`, another has `-changelog` or `-version` or `-V` or just: `version` etc, etc, rather inconsistent).

> To make things worse: `PHP -v` gives `CLI` version, instead of `running PHP`.

We can simply map them all to an understandable format:

```
located php -v
located apache -v
located dovecot -v
located postfix -v
located all -v           # show versions of all installed services!
```

Example of beautiful formatting:

```
located php -v
  CLI:     			PHP 8.1.2
  FPM:     			PHP 8.1.2  
  Running: 			PHP 8.1.2 (via php-fpm8.1)
  Config File:      /etc/php/8.1/fpm/php.ini
  Extensions:       mysqli, pdo_mysql, gd, curl, mbstring...
  Memory Limit:     128M
  Upload Max:       2M
  Post Max:         8M
```
And:
```
located apache -v
  Installed: 		Apache/2.4.52
  Running:   		Apache/2.4.52
  Mods available: 	mod_proxy, mod_evasive, ...
```

Firewall management

```
located -firewall 		 # shows/edits `iptables -L -n -v` (easy to forget, so shortcut: -firewall)
located -firewall6 		 # shows/edits `ip6tables -L -n -v` (easy to forget, so shortcut: -firewall6)

located -firewall -drop 192.168.1.50       # Block IP
located -firewall -drop 2001:db8::1        # Auto-detects IPv6
located -firewall -accept 10.0.0.5         # Whitelist IP to all ports
located -firewall -accept 10.0.0.5 -p 22   # Whitelist IP to port 22
located -firewall -remove 192.168.1.50     # undo a rule
```

Vhosts management (very difficult to memorize all sites/configs/enabled/available/ssl etc if many vhosts)

```
located -vhosts          # Apache/Nginx virtual host configs
located -sites           # all sites configs
```

Search on filesize.

```
located -size >100M      # files larger than 100M
located -size <10M       # files smaller than 10M
located -size 50M-200M   # files between 50M and 200M
```

We could combine it with the other modes too:

```
located -logs -size +100M     # big log files eating disk space
located -archive -size +1G    # large archives
located -all -size +500M      # any large config/system files
```