#
# Author:: Panagiotis Papadomitsos (<pj@ezgr.net>)
#
# Copyright 2013, Panagiotis Papadomitsos
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  
  config.vm.box = 'ubuntu'
  config.vm.host_name = 'jemalloc'
  config.vm.boot_mode = :gui
  config.vm.network :hostonly, '172.16.6.2'
  
  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = {}

    chef.run_list = [
      'recipe[jemalloc::default]'
    ]

  end
end
