# Fusion Studio
[![Build Status](https://travis-ci.com/evolvedbinary/fusion-studio.svg?branch=master)](https://travis-ci.com/evolvedbinary/fusion-studio)

An IDE and Management Tool for FusionDB.

This repository holds the code for packaging the IDE as a client Desktop application. To use this with FusionDB you will also need the server-side API installed, you can find that here: [fusion-studio-api](https://github.com/evolvedbinary/fusion-studio-api).

## Building

### Prerequisites
* Node.js 8.15.0
    ```bash
    $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
    $ nvm install 8.15.0
    ```

* yarn 1.2.1+
    ```bash
    $ npm install -g yarn
    ```

* Git 2.11+
* Java 8+ (Currently, Java 9 is not supported.)
* Python 2.7.x (Python 3, is not supported.)

First, build the Fusion Studio extension (**NOTE**: this step will not be needed in the near future):
```bash
$ git clone https://github.com/evolvedbinary/fusion-studio-extension.git
$ cd fusion-studio-extension
$ yarn && yarn run sass
$ cd ..
```

Second, build the Fusion Studio application package:
```bash
$ git clone https://github.com/evolvedbinary/fusion-studio.git
$ cd fusion-studio
$ yarn && yarn build && yarn package
```

Desktop Applications are then available in the `fusion-studio/dist` folder.
