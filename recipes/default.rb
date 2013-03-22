#
# Cookbook Name:: jemalloc
# Recipe:: default
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

jem_filename = ::File.basename(node['jemalloc']['url'])
jem_path = "#{Chef::Config['file_cache_path'] || '/tmp'}/jemalloc-#{node['jemalloc']['version']}"
jem_libdir = (platform_family?('rhel') && node['kernel']['machine'].eql?('x86_64')) ? '/usr/lib64' : '/usr/lib'

remote_file "#{Chef::Config['file_cache_path'] || '/tmp'}/#{jem_filename}" do
  owner 'root'
  group 'root'
  mode 00644
  source node['jemalloc']['url']
  checksum node['jemalloc']['checksum']
  action :create_if_missing
end

execute 'extract-jemalloc' do
  user 'root'
  cwd(Chef::Config['file_cache_path'] || '/tmp')
  command "tar xjf #{jem_filename}"
  not_if { ::File.directory?(jem_path)}
end

bash 'compile-jemalloc' do
  user 'root'
  cwd jem_path
  code <<-EOH
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-debug \\
  #{'--enable-lazy-lock' if node['jemalloc']['configure']['lazy_lock']} \\
  #{'--enable-munmap' if node['jemalloc']['configure']['munmap']} \\
  #{'--enable-xmalloc' if node['jemalloc']['configure']['xmalloc']} \\
  #{'--enable-dss' if node['jemalloc']['configure']['dss']} \\
  #{'--enable-mremap' if node['jemalloc']['configure']['mremap']} \\
  #{'--disable-stats' unless node['jemalloc']['configure']['stats']} \\
  #{'--enable-prof ' if node['jemalloc']['configure']['profiling']} \\
  #{'--disable-valgrind' unless node['jemalloc']['configure']['valgrind']} &&
  make
  EOH
  not_if { ::File.exists?("#{jem_path}/lib/libjemalloc.so.1")}
end

execute 'install-jemalloc' do
  command 'make install'
  cwd jem_path
  not_if { ::FileUtils.cmp("#{jem_path}/lib/libjemalloc.so.1", "#{jem_libdir}/libjemalloc.so.1") rescue false }
  action :run
  notifies :run, 'execute[jemalloc-ldconfig]'
end

execute 'jemalloc-ldconfig' do
  command 'ldconfig'
  action :nothing
end
