# !/bin/bash
abi=80
user=ccheraa
ignoredbinaries="ffmpeg conpty_console_list conpty"
server=static.evolvedbinary.com
basedir=/www-data/static.evolvedbinary.com/fusion-studio-bin
os=$1
function ignored {
  [[ $ignoredbinaries =~ (^|[[:space:]])$1($|[[:space:]]) ]]
}
function upload {
  echo processing $1:
  [[ $1 =~ .*/build/Release/(.*).node ]]
  file=${BASH_REMATCH[1]}
  ignored $file
  if [[ $? == "0" ]]; then
    echo "package in ignore list, skipped."
  else
    [[ $1 =~ node_modules/([^/]+/)*([^/]+)/build/Release/(.*).node ]]
    pkgpath=${BASH_REMATCH[1]}
    pkg=${BASH_REMATCH[2]}
    pkgjson=node_modules/$pkgpath$pkg/package.json
    pkgversion=$(cat $pkgjson | grep '"version"' | sed 's/.*"version".*"\(.*\)".*/\1/')
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      platform=linux
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      platform=darwin
    else
      platform=win32
    fi
    tar=$pkg-v$pkgversion-electron-v$abi-$platform-x64.tar.gz;
    dir=$pkg/v$pkgversion;
    tardir=$basedir/$dir;
    tarpath=$tardir/$tar;
    ssh $user@$server "[[ -f $tarpath ]];"
    if [[ $? == "0" ]]; then
      echo $pkg@$pkgversion found, no need to re-upload.
    else
      printf "$pkg@$pkgversion not found. uploading...\n"
      tmp=/tmp/$tar
      mkdir -p $tmp/build/Release
      cp $1 $tmp/build/Release
      tar -czf $tmp/$tar --directory=$tmp build > /dev/null
      ssh $user@$server "mkdir -p \"$tardir\""
      scp -q $tmp/$tar $user@$server:$tardir
      rm -rf $tmp
    fi
  fi
}
function list {
  if [[ "$os" == "win" ]]; then
    ls -R node_modules | {
    while IFS= read -r filename
      do
        if [[ "$filename" =~ (.*):$ ]]; then
          dir=${BASH_REMATCH[1]}
        else
          if [[ "$filename" != "" ]]; then
              echo "$dir/$filename"
          fi
        fi
      done
    } | grep /build/Release | grep .node | {
      while IFS= read -r path
      do
        if [[ $path =~ $root/(.*)/build/Release/([^/]*).node ]] && [[ ${BASH_REMATCH[2]} != ffmpeg ]]; then
          echo "$path"
        fi
      done
    } | {
      while IFS= read -r path
      do
        echo "$path"
      done
    }
  else
    find node_modules -wholename "*/build/Release/*.node" -exec bash -c '[[ $(dirname $1) == *build/Release ]] && [[ $1 =~ node_modules/(.*)/build/Release/(.*).node ]] && echo $1' bash {} \;
  fi
}
l=$(list)
for x in $l
do
  upload $x
done
echo done!