 #!/usr/bin/env python
 # -*- coding: utf-8 -*-
import os
from distutils.core import setup


README=''

setup(name='assimp',
      version='4.1.4',
      license='ISC',
      description='Python bindings for the Open Asset Import Library (ASSIMP)',
      long_description=README,
      url='https://github.com/mikedh/pyassimp',
      maintainer='Mike Dawson-Haggerty',
      maintainer_email='mikedh@kerfed.com',
      packages=['assimp'],
      requires=['numpy']
      )
