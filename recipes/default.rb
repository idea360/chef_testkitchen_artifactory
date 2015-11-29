#
# Cookbook Name:: chef_jfrog_artifactory
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
#####
# Get java setup, using oracle java
#####
include_recipe 'java::default'
#####
# Install packages and sets up system user
#####
include_recipe 'chef_jfrog_artifactory::__env_setup'
#####
# Update our apt packages.
#####
include_recipe 'apt::default'
#####
# Used to run artifact as a service.
#####
include_recipe "runit::default"

artifact_deploy 'artifactory_oss' do
  artifact_name       node['artifact']['artifact_name']
  artifact_location   node['artifact']['location']
  artifact_checksum   node['artifact']['checksum']
  owner               node['artifactory']['user']
  group               node['artifactory']['group']
  version             node['artifact']['version']
  deploy_to           node['artifact']['deploy_to']
  remove_top_level_directory true

  before_deploy Proc.new {}
  before_extract Proc.new {
    #####
    # create an directory to deploy/extract to.
    #####
    directory node['artifact']['deploy_to'] do
      action  :create
      owner   node['artifactory']['user']
      group   node['artifactory']['group']
      mode    node['artifactory']['mode']
    end
  }
  after_extract Proc.new {}
  before_symlink Proc.new {}
  after_symlink Proc.new {}
  configure Proc.new {}
  before_migrate Proc.new {}
  migrate Proc.new {}
  after_migrate Proc.new {}
  restart Proc.new {}
  after_deploy Proc.new {}
  after_download Proc.new {}
end
