#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node["platform"] == "ubuntu"
        execute "apt-get update -y" do
	end
end

package "apache2" do
        package_name node["apache"]["package"]
	action :install
end

node["apache"]["sites"].each do |sitename, data|
	document_root = "/content/sites/#{sitename}"
	
	directory document_root do
		mode "0755"
		recursive true
	end
	
	if node["platform"] == "ubuntu"
		template_location = "/etc/apache2/sites-enabled/#{sitename}.conf"
	elsif node["platform"] == "centos"
		template_location = "/etc/httpd/conf.d/#{sitename}.cond"
	end

	template template_location do
		source "vhost.erb"
		mode "0644"
		variables(
			:document_root => document_root,
			:port => data["port"],
			:domain => data["domain"]
		)
		notifies :restart, "service[httpd]"
	end
	
	template "/content/sites/#{sitename}/index.html" do
		source "index.html.erb"
		mode "0644"
		variables(
			:site_title => data["site_title"],
			:comingsoon => "Coming Soon!"
		)
	end
end

execute "rm /etc/httpd/conf.d/welcome.conf" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart, "service[httpd]"
end

execute "rm /etc/httpd/conf.d/README" do
        only_if do
                File.exist?("/etc/httpd/conf.d/README")
        end
        notifies :restart, "service[httpd]"
end

service "httpd" do
	service_name node["apache"]["package"]
	action [:enable, :start]
end
