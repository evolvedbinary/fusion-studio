# Pebble
[![Build Status](https://travis-ci.com/evolvedbinary/pebble.svg?branch=master)](https://travis-ci.com/evolvedbinary/pebble)

An IDE and Management Tool for Granite.

This repository holds the code for packaging the IDE as a client Desktop application. To use this with Granite you will also need the server-side API installed, you can find that here: [pebble-api](https://github.com/evolvedbinary/pebble-api).

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

First, build the pebble extension (**NOTE**: this step will not be needed in the near future):
```bash
$ git clone https://github.com/evolvedbinary/pebble-extension.git
$ cd pebble-extension
$ yarn && yarn run sass
$ cd ..
```

Second, build the pebble application package:
```bash
$ git clone https://github.com/evolvedbinary/pebble.git
$ cd pebble
$ yarn && yarn build && yarn package
```

Applications are in the `pebble/dist` folder.
