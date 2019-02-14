set -xe

# preclean
rm -rf assimp
rm -rf assimp.zip

# which commit do we want to lock to
# we could do releases, but right now there is functionality in master
# that breaks the python bindings but hasn't been released
export ASSIMP_COMMIT="fadfaf88db12af41348f5347af2ee926723bc539"
# generate for different commits using: sha256sum assimp.zip
export ASSIMP_SHA="34300d1a67bd4882b168bf9d7a606f065b5b0c8bdd4a49634d7fae7d19d8f58d"

# get the assimp files
curl -L -o assimp.zip https://github.com/assimp/assimp/archive/${ASSIMP_COMMIT}.zip
# check hash of downloaded file
echo "${ASSIMP_SHA}  assimp.zip" | sha256sum --check

# unzip archive
unzip -qq assimp.zip
# move assimp from crazy hash location
mv "assimp-${ASSIMP_COMMIT}" assimp

# build assimp
cd assimp
# skip tools and tests: tools requires cmake 3+
cmake -DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF .
# actually build
make -j4
# install assimp
make install
