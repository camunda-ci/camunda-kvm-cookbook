name             'camunda-kvm-cookbook'
maintainer       'Christian Lipphardt'
maintainer_email 'christian.lipphardt@camunda.com'
license          'Apache 2.0'
description      'Installs/Configures camunda-kvm-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION'))

recipe 'camunda-kvm-cookbook::default', 'Installs/Configures camunda-kvm-cookbook.'

supports 'ubuntu', '14.04'
