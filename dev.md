# Setup Development Repository

## mini-dinstall

Please use the following command to update the repo

```
$ mini-dinstall -v --no-db -b -c .mini-dinstall.conf
```

It is needed to put a sign script /tmp/sign-release.sh

```
#!/bin/sh

rm -f Release.gpg
echo "PASSWORD" | gpg --no-tty --batch --passphrase-fd=0 --default-key BDC8D74E641C2BC34632A5F3AB62C67FC0C4CC4C --detach-sign -o Release.gpg "$1"
```
