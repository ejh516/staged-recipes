SET KITE_ROOT="%cd%"

REM Install KITEx
sed -i.bak '/set(CMAKE_\w\+_COMPILER/d' ./CMakeLists.txt
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=%PREFIX% ..
make -j%CPU_COUNT%
make install

REM Install KITE-tools
cd %KITE_ROOT%
cd tools
sed -i.bak '/set(CMAKE_\w\+_COMPILER/d' ./CMakeLists.txt
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=%PREFIX% ..
make -j%CPU_COUNT%
make install

REM Install kite.py package
cd %KITE_ROOT%
python setup.py install
