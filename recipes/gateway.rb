package 'libcurl3'
package 'libcurl3-gnutls'
package 'libcurl4-openssl-dev'

  m_nodes = search(:node, "role:cloudfoundry_controller")
  m_node = m_nodes.first
  
  node.set[:cloudfoundry_mysql_service][:searched_data][:cloudfoundry_cloud_controller][:server][:api_uri] = m_node.cloudfoundry_cloud_controller.server.api_uri
  node.set[:cloudfoundry_mysql_service][:searched_data][:cloudfoundry_common][:service_token] = m_node.cloudfoundry_common.service_token
  
  n_nodes = search(:node, "role:cloudfoundry_nats_server")
  n_node = n_nodes.first
  
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:host] = n_node.ipaddress  
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:user] = n_node.nats_server.user
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:password] = n_node.nats_server.password
  node.set[:cloudfoundry_mysql_service][:searched_data][:nats_server][:port] = n_node.nats_server.port




cloudfoundry_component "mysql_gateway" do
  install_path File.join(node.cloudfoundry_common.vcap.install_path, "services", "mysql")
  bin_file     File.join(node.cloudfoundry_common.vcap.install_path, "bin", "services", "mysql_gateway")
  pid_file     node.cloudfoundry_mysql_service.gateway.pid_file
  log_file     node.cloudfoundry_mysql_service.gateway.log_file
end
