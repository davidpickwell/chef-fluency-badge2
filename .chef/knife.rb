# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "davidp"
client_key               "#{current_dir}/davidp.pem"
chef_server_url          "https://api.chef.io/organizations/linux-academy-davidp"
cookbook_path            ["#{current_dir}/../cookbooks"]
