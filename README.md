# Add BerryNet Repository

Add the content matching your target system in `/etc/apt/sources.list.d/berrynet.list`.

For RPi

```
deb https://raw.githubusercontent.com/DT42/BerryNet-repo/master stretch/
deb-src https://raw.githubusercontent.com/DT42/BerryNet-repo/master stretch/
```

Then execute the command in terminal

```
$ sudo apt-get update  # use apt-get instead of apt to avoid unsigned repo error
```
