# Fusion Studio
<!-- [![Build Status](https://travis-ci.com/evolvedbinary/fusion-studio.svg?branch=master)](https://travis-ci.com/evolvedbinary/fusion-studio) -->
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/bqkb0mxxacbtmm6w/branch/master?svg=true)](https://ci.appveyor.com/project/AdamRetter/fusion-studio/branch/master) -->
[![License](https://img.shields.io/badge/license-GPL%203-blue.svg)](https://opensource.org/licenses/GPL-3.0)

An IDE and Management Tool for FusionDB.

This repository holds the code for packaging the IDE as a client Desktop application. 
To use this with FusionDB you will also need the server-side API installed, you can find that here: [fusion-studio-api](https://github.com/evolvedbinary/fusion-studio-api).

The latest reslease version of FusionDB is available for download from [https://fusiondb.com](https://fusiondb.com).


## Requirements
* Node.js 14
* yarn 1.17.3+
* Git 2.11+
* Java 8
* Python 3
* rpmbuild (for building RPM's on Linux)
* Apple Developer Certificate and Account (for signing DMG's on macOS)

## Building the Fusion Studio Application

We suggest using [nvm](https://github.com/nvm-sh/nvm#installing-and-updating) for running and managing different node versions.

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install 14
nvm use 14
```

Install the latest version of yarn compatible with the recommended node version.

```bash
npm install -g yarn
```

### On Linux and macOS:

```bash
git clone https://github.com/evolvedbinary/fusion-studio.git
cd fusion-studio
export NODE_OPTIONS="--max-old-space-size=8192"
yarn install --ignore-engines && yarn build
```

### On Windows:
```pwsh
git clone https://github.com/evolvedbinary/fusion-studio.git
cd fusion-studio
set NODE_OPTIONS=--max-old-space-size=8192
yarn install --ignore-engines && yarn build
```

## Creating Application Packages

After building you can produce native application packages such as: `.exe`, `.dmg`, `.deb`, and `.rpm`.

### On Linux and Windows:
```bash
yarn package
```

### On macOS:
The `APPLE_ID` and `APPLE_ID_PASSWORD` are used for notarization of the app. If you don't need notarization you can skip these. 
Remember, notarization can be a slow process which can take 10+ minutes with little or no output to the console … so remain patient!

```bash
APPLE_ID=me@something.com APPLE_ID_PASSWORD=abcd-efgh-ijkl-mnop yarn package
```

Application packages are then available in the `fusion-studio/dist` folder.
