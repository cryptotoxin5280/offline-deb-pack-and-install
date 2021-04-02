# Offline .DEB Pack-and-Install Tool

## Usage
1. Download the scripts to an Internet-connected Debian-based device.

2. Execute the package downloader script.
```
./download-depends.sh
```

3. Copy the generated .zip file to the Internet-isolated target device.

4. Unpack and unzip the tarball file.
```
tar -xvf depends-[date +%F-%H%M].tar.gz
```

5. Execute the package installer.
```
./depends/install-depends.sh
```
