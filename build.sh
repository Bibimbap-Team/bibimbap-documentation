#bin/bash
tsp compile src
rm -rf build
mkdir build
mkdir build/bibimbap-documentation
cp favicon-*.png build/bibimbap-documentation
cp index.html build/bibimbap-documentation
cp -r tsp-output build/bibimbap-documentation
cp -r vendors build/bibimbap-documentation
echo '<meta http-equiv="refresh" content="0; url=/bibimbap-documentation" />' > build/index.html
