include_attribute "cloudfoundry-common"

# Where to write the mysql service gateway's pid.
default['cloudfoundry_mysql_service']['gateway']['pid_file'] = File.join(node.cloudfoundry_common.pid_dir, "mysql_gateway.pid")

# Where to write the mysql service gateway's logs.
default['cloudfoundry_mysql_service']['gateway']['log_file'] = File.join(node.cloudfoundry_common.log_dir, "mysql_gateway.log")

# Log level for the msyql service gateway.
default['cloudfoundry_mysql_service']['gateway']['log_level'] = "info"

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['gateway']['node_timeout'] = 2

# Where to write the mysql service node's pid.
default['cloudfoundry_mysql_service']['node']['pid_file'] = File.join(node.cloudfoundry_common.pid_dir, "mysql_node.pid")

# Where to write the mysql service node's logs.
default['cloudfoundry_mysql_service']['node']['log_file'] = File.join(node.cloudfoundry_common.log_dir, "mysql_node.log")

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['node']['base_dir'] = File.join(node.cloudfoundry_common.services_dir, "mysql")

# Log level for the msyql service node.
default['cloudfoundry_mysql_service']['node']['log_level'] = "info"

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['node']['index'] = 0

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['node']['available_storage'] = 1024

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['node']['max_db_size'] = 20

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['node']['max_long_query'] = 3

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['node']['max_long_tx'] = 30

# TODO (trotter): Find out what this does.
default['cloudfoundry_mysql_service']['node']['migration_nfs'] = "/mnt/migration"

# Samir : Attributes défined in recipe 

default['cloudfoundry_mysql_service']['node']['bind_address'] = "0.0.0.0"
default['cloudfoundry_mysql_service']['node']['user'] = "root"
default['cloudfoundry_mysql_service']['node']['password'] = ""

default['cloudfoundry_mysql_service']['searched_data']['cloudfoundry_cloud_controller']['server']['api_uri'] = ''

default['cloudfoundry_mysql_service']['searched_data']['cloudfoundry_common']['service_token']=''
default['cloudfoundry_mysql_service']['searched_data']['nats_server']['host']=''

default['cloudfoundry_mysql_service']['searched_data']['nats_server']['user']=''
default['cloudfoundry_mysql_service']['searched_data']['nats_server']['password']=''
default['cloudfoundry_mysql_service']['searched_data']['nats_server']['port']=''

default['cloudfoundry_mysql_service']['cf_session']['cf_id'] = '1'
default['cloudfoundry_mysql_service']['cf_session']['name'] = ''
