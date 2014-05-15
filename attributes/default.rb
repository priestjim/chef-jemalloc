#
# Cookbook Name:: jemalloc
# Attribute:: default
#
# Copyright (C) 2013 Panagiotis Papadomitsos
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['jemalloc']['version']                = '3.6.0'
default['jemalloc']['url']                    = "http://www.canonware.com/download/jemalloc/jemalloc-#{node['jemalloc']['version']}.tar.bz2"
default['jemalloc']['checksum']               = 'e16c2159dd3c81ca2dc3b5c9ef0d43e1f2f45b04548f42db12e7c12d7bdf84fe'

# Configure options
default['jemalloc']['configure']['munmap']    = true
default['jemalloc']['configure']['lazy_lock'] = true
default['jemalloc']['configure']['xmalloc']   = false
default['jemalloc']['configure']['dss']       = false
default['jemalloc']['configure']['mremap']    = false

default['jemalloc']['configure']['stats']     = false
default['jemalloc']['configure']['profiling'] = false
default['jemalloc']['configure']['valgrind']  = false
