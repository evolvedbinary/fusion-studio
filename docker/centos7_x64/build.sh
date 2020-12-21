# !/bin/sh
source /root/.bashrc
yarn config set drivelist_binary_host http://dv.evolvedbinary.com/fusion-studio/prebuild/drivelist
yarn config set @theia/node-pty_binary_host http://dv.evolvedbinary.com/fusion-studio/prebuild/node-pty
yarn config set find-git-repositories_binary_host http://dv.evolvedbinary.com/fusion-studio/prebuild/find-git-repositories
yarn config set native-keymap_binary_host http://dv.evolvedbinary.com/fusion-studio/prebuild/native-keymap
yarn config set nsfw_binary_host http://dv.evolvedbinary.com/fusion-studio/prebuild/nsfw
yarn config set oniguruma_binary_host http://dv.evolvedbinary.com/fusion-studio/prebuild/oniguruma
cp /root/force-download.js /project
cd /project
if [ -d /project/node_modules ]; then
   mv /project/node_modules /project/node_modules.bak
fi
yarn
node /project/force-download @theia/node-pty nsfw find-git-repositories drivelist native-keymap oniguruma -p /project
yarn package:all -c electron-builder.docker.yml
node /project/force-download @theia/node-pty nsfw find-git-repositories drivelist native-keymap oniguruma -r -p /project
rm /project/force-download.js
rm -rf node_modules
if [ -d /project/node_modules.bak ]; then
   mv /project/node_modules.bak /project/node_modules
fi
chown -R $USER:$GROUP $HOME /project