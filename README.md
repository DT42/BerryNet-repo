# BerryNet Repository

BerryNet leverages Debian package management system to control system quality, and make installation easier. Our goal is to making all these packages to be available into Debian. Before these packages are accepted officially, you still can get them easily by using this repository.

# Add BerryNet Repository

Add the content matching your target system in `/etc/apt/sources.list.d/berrynet.list`.

For RPi

```
deb https://raw.githubusercontent.com/DT42/BerryNet-repo/master stretch/
deb-src https://raw.githubusercontent.com/DT42/BerryNet-repo/master stretch/
```

Then execute the command in terminal

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0C4CC4C
$ sudo apt update
```
