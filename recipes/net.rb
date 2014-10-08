#
# Cookbook Name:: camunda-cookbook-template
# Recipe:: default
#
# Copyright (C) 2014 Christian Lipphardt
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

config_net = File.join(Chef::Config[:file_cache_path], "net.tmp")

template config_net do
  source "net.tmp.temp"
end

execute "Conf_Network" do
  command "cat #{config_net} > /etc/network/interfaces"
end

#execute "Reboot" do
#  command "reboot"
#  command "/etc/init.d/networking restart"
#end

include_recipe 'camunda-kvm-cookbook::kvm'