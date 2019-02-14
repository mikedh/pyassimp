#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import setuptools

try:
    with open('README.md', 'r') as f:
        README = f.read()
except BaseException:
    README = ''

# since pyassimp has no built components (ctypes)
# we are going to create a dummy source file that
# setuptools can build to feel proud of itself.
# if we don't do this the magical CI pipeline tags
# images as universal rather than platform specific
with open('assimp/dummy.cpp', 'w') as f:
    f.write('int main(){return 0;}')


setuptools.setup(
    name='assimp',
    version='4.1.4',
    license='ISC',
    description='Python bindings for the Open Asset Import Library (ASSIMP)',
    long_description=README,
    url='https://github.com/mikedh/pyassimp',
    maintainer='Mike Dawson-Haggerty',
    maintainer_email='mikedh@kerfed.com',
    packages=['assimp'],
    requires=['numpy'],
    ext_modules=[setuptools.Extension('assimp.dummy',
                                      ['assimp/dummy.cpp'])])
