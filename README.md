# Nilsu's Void Repo
[https://pkg.nilsu.org/void](https://pkg.nilsu.org/void)

This repository works similarly to the official void package repository. See
their [README](https://github.com/void-linux/void-packages/) for details of
usage.

## Installing
First create the file `/etc/xbps.d/20-nilsu.conf` with these contents:
```
repository=https://pkg.nilsu.org/void
```

Then run and accept the key when prompted:
```
sudo xbps-install -Su
```

# List all packages
You can list all packages in this repo using `xpkg` from `xtools`:
```
xpkg -R https://pkg.nilsu.org/void -a
```
