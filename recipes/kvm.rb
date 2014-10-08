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

node['kvm']['host']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

execute "add_to_group" do
  command "adduser #{node['kvm']['user']} libvirtd"
end

execute "mount" do
  command "if [ ! -d \"/home/smb\" ]; then mkdir /home/smb; fi; if [ ! -d \"#{node['kvm']['images_dir']}\" ]; then mkdir #{node['kvm']['images_dir']}; fi; mount -t cifs -o user=camunda,pass=ruessel //192.168.178.244/share/Vagrant-Box-stuff/qemu /home/smb;"
end

config_qemu = File.join(Chef::Config[:file_cache_path], "qemu.xml")

template config_qemu do
  source "qemu.xml.temp"
end

node['kvm']['vms']['name'].each do |name|
	execute "copy" do
	  command "if [ ! -f #{node['kvm']['images_dir'] + node['kvm']['vms'][name]['file']} ]; then cp /home/smb/#{node['kvm']['vms'][name]['file']} #{node['kvm']['images_dir']}; fi;"
	end
	execute name do
#	  command "virt-install --connect qemu:///system --ram #{node['kvm']['vms'][name]['ram']} -n #{name} --os-type=#{node['kvm']['vms'][name]['os_type']} --disk path=#{node['kvm']['images_dir'] + node['kvm']['vms'][name]['file']},device=disk,bus=virtio,format=#{node['kvm']['vms'][name]['format']} --vcpus=#{node['kvm']['vms'][name]['vcpu']} --noautoconsole --import"
      command "virsh create #{config_qemu}"
	end
end