#
# Cookbook Name:: cloudfoundry-msyql-service
# Recipe:: default
#
# Copyright 2012, Trotter Cashion
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
#default['cloudfoundry_mysql_service']['cf_session']['cf_id'] = '1'
#default['cloudfoundry_mysql_service']['cf_session']['name'] = ''


if Chef::Config[:solo]
   Chef::Log.warn("This recipe uses search. Chef Solo does not support search.")
else 
include_recipe 'cloudfoundry-common'

#sudo apt-get install libsqlite3-dev 
#sudo apt-get install libmysqlclient-dev

package 'libsqlite3-dev'
package 'libmysqlclient-dev'



#package "libsqlite3-dev" do
#  action :install
#end


#chef_gem "do_sqlite3" 
#g = gem_package "do_sqlite3" do
#   version "0.10.3"
#   action :nothing
#end
#g.run_action(:install)
#Gem.clear_paths
#require 'do_sqlite3'

#chef_gem "mysql2" 
#gem install mysql2 -v '0.3.10'
#g = gem_package "mysql2" do
#   version "0.3.10"
#   action :nothing
#end
#g.run_action(:install)
#Gem.clear_paths
#require 'mysql2'



  cf_id_node = node['cloudfoundry_mysql_service']['cf_session']['cf_id']
  m_nodes = search(:node, "role:cloudfoundry_controller AND cf_id:#{cf_id_node}")
  m_node = m_nodes.first
  
  node.set['cloudfoundry_mysql_service']['searched_data']['cloudfoundry_cloud_controller']['server']['api_uri'] = "" + m_node.ipaddress + ":80" #m_node.cloudfoundry_cloud_controller.server.api_uri
  node.set['cloudfoundry_mysql_service']['searched_data']['cloudfoundry_common']['service_token'] = m_node.cloudfoundry_common.service_token
  
  n_nodes = search(:node, "role:cloudfoundry_nats_server AND cf_id:#{cf_id_node} ")
  n_node = n_nodes.first
  
  node.set['cloudfoundry_mysql_service']['searched_data']['nats_server']['host'] = n_node.ipaddress  
  node.set['cloudfoundry_mysql_service']['searched_data']['nats_server']['user'] = n_node.nats_server.user
  node.set['cloudfoundry_mysql_service']['searched_data']['nats_server']['password'] = n_node.nats_server.password
  node.set['cloudfoundry_mysql_service']['searched_data']['nats_server']['port'] = n_node.nats_server.port

end 


include_recipe "cloudfoundry-mysql-service::gateway"
include_recipe "cloudfoundry-mysql-service::node"
