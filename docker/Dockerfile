# NOTE: this docker file is only for local testing of the build
# it should be copied or symlinked up one directory as docker
# can't go into parent directories
# example of testing a build locally:
# ln -sf requirements/Dockerfile .
# docker build . -t pyassimp

# manylinux is the same as cibuildhweel uses
FROM quay.io/pypa/manylinux1_x86_64:latest

RUN yum install -y gcc glibc.i686

# download and install newer cmake
COPY docker/cmake.bash .
RUN bash cmake.bash

# download, build, and install assimp
COPY docker/assimp.bash .
RUN bash assimp.bash

# manylinux includes a bunch of pythons
# to test with others change this env variable
#ENV PATH=/opt/python/cp27-cp27m/bin:$PATH
ENV PATH=/opt/python/cp36-cp36m/bin:$PATH

# we need numpy to build assimp
RUN pip install numpy cython 

# build the python-fcl module
COPY . /pyassimp

RUN cd /pyassimp && python setup.py build_ext

