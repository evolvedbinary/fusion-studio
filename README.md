# Pebble
[![Build Status](https://travis-ci.com/evolvedbinary/pebble.svg?branch=master)](https://travis-ci.com/evolvedbinary/pebble)

An IDE and Management Tool for Granite

## Building

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
