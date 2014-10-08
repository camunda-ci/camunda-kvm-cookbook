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

default['kvm']['host']['packages'] 			= %w(qemu-kvm libvirt-bin virtinst)
default['kvm']['user'] 						= 'camunda'
default['kvm']['images_dir']				= '/home/camunda/images/'

default['kvm']['vms']['name']				= %w(mssql12)

default['kvm']['vms']['mssql12']['vcpu']	= '1'
default['kvm']['vms']['mssql12']['ram']		= '1024'
default['kvm']['vms']['mssql12']['arch']	= 'x86_64'
default['kvm']['vms']['mssql12']['mac']		= '52:54:00:63:27:cb'
default['kvm']['vms']['mssql12']['os_type']	= 'windows'
default['kvm']['vms']['mssql12']['file']	= 'packer-windows2012.qcow2'
default['kvm']['vms']['mssql12']['format']	= 'qcow2'