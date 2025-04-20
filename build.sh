#bin/bash
tsp compile src
rm -rf build
mkdir build
cp favicon-*.png build
cp index.html build
cp -r tsp-output build
cp -r vendors build

