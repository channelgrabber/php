#
# Author::  Joshua Timberman (<joshua@opscode.com>)
# Author::  Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: php
# Recipe:: module_mysql
#
# Copyright 2009-2011, Opscode, Inc.
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

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => "php53-mysql",
    "default" => "php-mysql"
  },
  "default" => "php5-mysql"
)

nd_pkg = value_for_platform(
  "default" => "php5-mysqlnd"
)

if node['php']['mysql']['mysqlnd']
  package pkg do
    action :remove
  end

  package nd_pkg do
    options "--assume-no"
    action :upgrade
  end

  enable_pear_mod 'mysqlnd'
else
  package nd_pkg do
    action :remove
  end

  package pkg do
    options "--assume-no"
    action :upgrade
  end
end
