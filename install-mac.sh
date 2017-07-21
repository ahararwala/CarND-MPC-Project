#! /bin/bash
brew install openssl libuv cmake zlib
git clone https://github.com/uWebSockets/uWebSockets 
cd uWebSockets
git checkout e94b6e1
patch CMakeLists.txt < ../cmakepatch.txt
mkdir build
export PKG_CONFIG_PATH=/usr/local/Cellar/openssl/1.0.2k/lib/pkgconfig
cd build
cmake -DOPENSSL_ROOT_DIR=/usr/local/Cellar/openssl/1.0.2k -DOPENSSL_LIBRARIES=/usr/local/Cellar/openssl/1.0.2k/lib ..
make
sudo make install
cd ..
cd ..
sudo rm -r uWebSockets