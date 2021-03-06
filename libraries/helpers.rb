#
# Author::  Joshua Timberman (<joshua@opscode.com>)
# Cookbook Name:: php
# Libraries:: helpers
#
# Copyright 2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def el5_range
  (0..99).to_a.map{|i| "5.#{i}"}
end

def enable_pear_mod (module_name)
  config_file = File.join(node['php']['ext_conf_dir'], "#{module_name}.ini")

  bash "enable_pear_mod" do
    user "root"
    cwd node['php']['ext_conf_dir']
    code <<-EOH
      php5enmod #{module_name}
    EOH
    only_if {File.exists?(config_file)}
  end
end

def disable_pear_mod (module_name)
  config_file = File.join(node['php']['ext_conf_dir'], "#{module_name}.ini")

  bash "disable_pear_mod" do
    user "root"
    cwd node['php']['ext_conf_dir']
    code <<-EOH
      php5dismod #{module_name}
    EOH
    only_if {File.exists?(config_file)}
  end
end
