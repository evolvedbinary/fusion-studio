# !/bin/sh
source /root/.bashrc
source scl_source enable devtoolset-8
export npm_config_drivelist_binary_host=https://static.evolvedbinary.com/fusion-studio-bin/drivelist
export npm_config__theia_node_pty_binary_host=https://static.evolvedbinary.com/fusion-studio-bin/node-pty
export npm_config_find_git_repositories_binary_host=https://static.evolvedbinary.com/fusion-studio-bin/find-git-repositories
export npm_config_native_keymap_binary_host=https://static.evolvedbinary.com/fusion-studio-bin/native-keymap
export npm_config_nsfw_binary_host=https://static.evolvedbinary.com/fusion-studio-bin/nsfw
export npm_config_oniguruma_binary_host=https://static.evolvedbinary.com/fusion-studio-bin/oniguruma
cp /root/force-download.js /project
cd /project
if [ -d /project/node_modules ]; then
   mv /project/node_modules /project/node_modules.bak
fi
yarn --ignore-engines
node /project/force-download @theia/node-pty nsfw find-git-repositories drivelist native-keymap oniguruma -p /project
yarn package:all -c electron-builder.docker.yml
rm /project/force-download.js
rm -rf node_modules
if [ -d /project/node_modules.bak ]; then
   mv /project/node_modules.bak /project/node_modules
fi
chown -R $USER:$GROUP $HOME /project