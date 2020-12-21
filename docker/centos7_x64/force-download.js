const { readFileSync, writeFileSync, existsSync, copyFileSync, unlinkSync } = require('fs');
const { resolve } = require('path');
const yargs = require('yargs');

const PREBUILD_INSTALL_VERSION = '5.2.4';

const argv = yargs
  .scriptName('force-download')
  .usage('$0 [options] modules')
  .option('verbose', {
    type: 'boolean',
    alias: ['v'],
    description: 'Log all coperations',
  })
  .option('restore', {
    type: 'boolean',
    alias: ['r'],
    description: 'Undo forcing the usage of prebuilt binaries',
  })
  .option('path', {
    type: 'string',
    alias: 'p',
    default: '.',
    description: 'Path to Fusion Studio project',
  })
  .help()
  .alias('help', 'h')
  .argv;

function l(...args) {
  if (argv.verbose) {
    console.log.apply(console, args);
  }
}

const modulesNames = argv._;

if (modulesNames.length < 1) {
  console.info('No modules defined.');
} else {
  const modulesPath = resolve(argv.path, 'node_modules');
  if (!existsSync(modulesPath)) {
    console.error('"node_modules" directory not found.\nMake sure to run this in Fusion Studio project\'s directory');
    process.exit(1);
  }
  const modules = modulesNames.map(module => ({
    name: module,
    path: resolve(modulesPath, module),
  }));
  const notFound = modules.find(module => !existsSync(module.path));
  if (notFound) {
    console.error('module "' + notFound.name + '" not found');
    process.exit(2);
  }
  modules.forEach(module => {
    const packagePath = resolve(module.path, 'package.json');
    const safePackagePath = resolve(module.path, 'package.safe.json');
    if (argv.restore) {
      if (!existsSync(safePackagePath)) {
        console.info('No defaults found for module "' + module.name + '". Skipping...');
        return;
      }
      try {
        copyFileSync(safePackagePath, packagePath);
        unlinkSync(safePackagePath);
      } catch (e) {
        console.error('couldn\'t restore "package.json" of module "' + module.name + '"');
        console.error('Error:', e);
        process.exit(5);
      }
    } else {
      if (!existsSync(packagePath)) {
        console.error('"package.json" file not found for module "' + module.name + '"');
        process.exit(3);
      }
      try {
        copyFileSync(packagePath, safePackagePath);
        const package = JSON.parse(readFileSync(packagePath, { encoding: 'utf-8' }));
        if (package.dependencies) {
          if (package.dependencies['prebuild-install']) {
            return;
          }
        } else {
          package.dependencies = {};
        }
        package.dependencies['prebuild-install'] = '^' + PREBUILD_INSTALL_VERSION;
        writeFileSync(packagePath, JSON.stringify(package, null, 2), { encoding: 'utf-8' });
      } catch (e) {
        console.error('couldn\'t process "package.json" of module "' + module.name + '"');
        console.error('Error:', e);
        process.exit(4);
      }
    }
  });
  console.info('Done!');
}