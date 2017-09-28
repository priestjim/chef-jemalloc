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

default['jemalloc']['version']                = '5.0.1'
default['jemalloc']['url']                    = "https://github.com/jemalloc/jemalloc/releases/download/#{node['jemalloc']['version']}/jemalloc-#{node['jemalloc']['version']}.tar.bz2"
default['jemalloc']['checksum']               = '4814781d395b0ef093b21a08e8e6e0bd3dab8762f9935bbfb71679b0dea7c3e9'

# Configure options
default['jemalloc']['configure']['munmap']    = true
default['jemalloc']['configure']['lazy_lock'] = true
default['jemalloc']['configure']['xmalloc']   = false
default['jemalloc']['configure']['dss']       = false
default['jemalloc']['configure']['mremap']    = false

default['jemalloc']['configure']['stats']     = false
default['jemalloc']['configure']['profiling'] = false
default['jemalloc']['configure']['valgrind']  = false
