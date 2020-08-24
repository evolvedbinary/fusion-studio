# Fusion Studio
[![Build Status](https://travis-ci.com/evolvedbinary/fusion-studio.svg?branch=master)](https://travis-ci.com/evolvedbinary/fusion-studio)
[![Build status](https://ci.appveyor.com/api/projects/status/bqkb0mxxacbtmm6w/branch/master?svg=true)](https://ci.appveyor.com/project/AdamRetter/fusion-studio/branch/master)
[![License](https://img.shields.io/badge/license-GPL%203-blue.svg)](https://opensource.org/licenses/GPL-3.0)

An IDE and Management Tool for FusionDB.

This repository holds the code for packaging the IDE as a client Desktop application. To use this with FusionDB you will also need the server-side API installed, you can find that here: [fusion-studio-api](https://github.com/evolvedbinary/fusion-studio-api).

## Building

### Prerequisites
* Node.js 10.16.3
    ```bash
    $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
    $ nvm install 10
    ```

* yarn 1.17.3+
    ```bash
    $ npm install -g yarn
    ```

* Git 2.11+
* Java 8+ (Currently, Java 9 is not supported.)
* Python 2.7.x (Python 3, is not supported.)
* rpmbuild (for building RPM's on Linux)
* Apple Developer Certificate and Account (for signing DMG's on macOS)

Build the Fusion Studio application (Linux/Mac):
```bash
$ git clone https://github.com/evolvedbinary/fusion-studio.git
$ cd fusion-studio
$ export NODE_OPTIONS="--max-old-space-size=8192"
$ yarn && yarn build
```

Build the Fusion Studio application (Windows):
```bash
> git clone https://github.com/evolvedbinary/fusion-studio.git
> cd fusion-studio
> set NODE_OPTIONS=--max-old-space-size=8192
> yarn && yarn build
```

## Packaging

After building, native application packages (e.g .exe, .dmg., .deb, and .rpm files) can also be produced:

Create an application package (Linux/Windows):
```bash
$ yarn package
```

Create an application package (Mac):
```bash
$ APPLE_ID=me@something.com APPLE_ID_PASSWORD=abcd-efgh-ijkl-mnop yarn package
```
**NOTE:** The `APPLE_ID` and `APPLE_ID_PASSWORD` are used for notarization of the app. If you don't need notarization you can skip these. Remember, notarization can be a slow process which can take 10+ minutes with little or no output to the console... so remain patient!

Application packages are then available in the `fusion-studio/dist` folder.
