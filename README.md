Description
===========

This simple recipe configures, compiles and installs the memory allocation
library `jemalloc` via source. jemalloc shines on high-request manycore
threaded applications and is a cheap upgrade if your workloads happen to fall
into this category.

Requirements
============

Platform
--------

The following platforms are supported and tested using Vagrant:

* Ubuntu 12.04, 12.10
* CentOS 6

Other Debian and RHEL family distributions are assumed to work.

Chef Server
-----------

The cookbook converges best on Chef installations >= 10.16.2

Attributes
==========

The following attributes are available on this cookbook:

* `node['jemalloc']['url']` and `node['jemalloc']['version']` - The version and URL that
  the library will be downloaded from
* `node['jemalloc']['checksum']` - The SHA-256 checksum of the above file

In addition, the following configuration flags are available as switches

* `node['jemalloc']['configure']['munmap']` - Enables the `munmap` feature of jemalloc
* `node['jemalloc']['configure']['lazy_lock']` - Enables lazy locking (locking on multi-threaded applications only)
* `node['jemalloc']['configure']['xmalloc']` - Enables the `xmalloc` feature of jemalloc
* `node['jemalloc']['configure']['dss']` - Enables `sbrk` along `mmap` for memory allocations
* `node['jemalloc']['configure']['mremap']` - Enables the `mremap` feature of jemalloc
* `node['jemalloc']['configure']['stats']` - Enables the statistics gathering features of jemalloc
* `node['jemalloc']['configure']['profiling']` - Enables the code profiling features of jemalloc
* `node['jemalloc']['configure']['valgrind']` - Enables valgrind support in jemalloc

Recipes
=======

## default.rb

The default recipe downloads, compiles and installs the selected version of
jemalloc.

Usage
=====

Include the recipe on your node or role. Modify the
attributes as required in your role to change how various
configuration is applied per the attributes section above. In general,
override attributes in the role should be used when changing
attributes.

License and Author
==================

- Author:: Panagiotis Papadomitsos (<pj@ezgr.net>)

Copyright 2013, Panagiotis Papadomitsos

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
