set -xe

# preclean
rm -rf assimp
rm -rf assimp.zip

# download release of assimp
curl -L -o assimp.zip https://github.com/assimp/assimp/archive/v4.1.0.zip
# check hash of downloaded file
echo "407be74f44f488fcf1aac3492d962452ddde89561906e917a208c75e1192bcdc  assimp.zip" | sha256sum --check

# unzip archive
unzip -qq assimp.zip
mv assimp-4.1.0 assimp

# build assimp
cd assimp
cmake .
make -j4
# install assimp
make install
