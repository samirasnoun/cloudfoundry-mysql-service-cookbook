include_recipe "mysql::server"

package 'libcurl3'
package 'libcurl3-gnutls'
package 'libcurl4-openssl-dev'

package "sqlite3"
package "libsqlite3-ruby"
package "libsqlite3-dev"

  node.set_unless['mysql']['bind_address'] = node.cloudfoundry_mysql_service.node.bind_address
  node.set[:cloudfoundry_mysql_service][:node][:password] = node.mysql.server_root_password 
  node.set[:cloudfoundry_mysql_service][:node][:user] = "root"

  n_nodes = search(:node, "role:cloudfoundry_nats_server")
  n_node = n_nodes.first
  
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:host] = n_node.ipaddress
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:user] = n_node.nats_server.user
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:password] = n_node.nats_server.password
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:port] = n_node.nats_server.port
  
   max=0
   i_nodes = search(:node, "role:cloudfoundry_mysql_node") #7role:cloudfoundry_mysql_node")
   max = i_nodes.count

   node.set[:cloudfoundry_mysql_service][:node][:index] = max



cloudfoundry_component "mysql_node" do
  install_path File.join(node.cloudfoundry_common.vcap.install_path, "services", "mysql")
  bin_file     File.join(node.cloudfoundry_common.vcap.install_path, "bin", "services", "mysql_node")
  pid_file     node.cloudfoundry_mysql_service.node.pid_file
  log_file     node.cloudfoundry_mysql_service.node.log_file
end

directory node.cloudfoundry_mysql_service.node.base_dir do
  owner node.cloudfoundry_common.user
  mode  "0755"
end
