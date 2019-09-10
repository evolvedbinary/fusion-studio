# Fusion Studio
[![Build Status](https://travis-ci.com/evolvedbinary/fusion-studio.svg?branch=master)](https://travis-ci.com/evolvedbinary/fusion-studio)
[![Build status](https://ci.appveyor.com/api/projects/status/bqkb0mxxacbtmm6w/branch/master?svg=true)](https://ci.appveyor.com/project/AdamRetter/fusion-studio/branch/master)

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

Build the Fusion Studio application package:
```bash
$ git clone https://github.com/evolvedbinary/fusion-studio.git
$ cd fusion-studio
$ yarn && yarn build && yarn package
```

Desktop Applications are then available in the `fusion-studio/dist` folder.
