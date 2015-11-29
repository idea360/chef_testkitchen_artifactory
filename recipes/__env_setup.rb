######
# Create a system user for artifactory to run under
######
user node['artifactory']['user'] do 
  comment 'Artifactory user'
  system  true
  home    node['artifactory']['home']
  action  :create
end 

#####
# Create a user and directory
#####
directory node['artifactory']['home'] do
  action  :create
  owner   node['artifactory']['user']
  group   node['artifactory']['group']
  mode    node['artifactory']['mode']
end 

#####
# Create our log directory for our runit service.
#####
directory '/var/log/artifactory' do 
  action  :create
  owner   node['artifactory']['user']
  group   node['artifactory']['group']
  mode    node['artifactory']['mode']
end 
