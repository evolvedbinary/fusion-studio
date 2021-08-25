/**
 * This file can be edited to customize webpack configuration.
 * To reset delete this file and rerun theia build again.
 */
// @ts-check
const config = require('./gen-webpack.config.js');
// const webpack = require('webpack');
// const yargs = require('yargs');

/**
 * Expose bundled modules on window.theia.moduleName namespace, e.g.
 * window['theia']['@theia/core/lib/common/uri'].
 * Such syntax can be used by external code, for instance, for testing.
config.module.rules.push({
    test: /\.js$/,
    loader: require.resolve('@theia/application-manager/lib/expose-loader')
}); */

// if (yargs.option('mode').argv.mode === 'development') {
//     console.log('Development mode. Including process variable...');
//     config.plugins.push(new webpack.ProvidePlugin({ process: require.resolve('process/browser') }));
//   }

module.exports = config;