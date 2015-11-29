#####
# Java cookbook overrides
#####
override['java']['install_flavor'] = 'oracle'
override['java']['oracle']['accept_oracle_download_terms'] = true
override['java']['jdk_version'] = '8'

#####
# chef_jfrog_artifactory attributes.
#####
default['artifactory']['user'] = 'artifactory'
default['artifactory']['group'] = 'artifactory'
default['artifactory']['mode'] = '0755'
default['artifactory']['home'] = '/opt/artifactory'

# Artifact cookbook attributes.
default['artifact']['name'] = 'jfrog-artifactory-oss-4.3.0.zip'
default['artifact']['location'] = 'https://bintray.com/artifact/download/jfrog/artifactory/jfrog-artifactory-oss-4.3.0.zip'
default['artifact']['checksum'] = 'ce530cc5e52c7a00599271978097cf5e478e1c3877ef48e575e2c039a453c46f'
default['artifact']['version'] = '4.3.0'
default['artifact']['deploy_to'] = "#{node['artifactory']['home']}/oss"
