#
# Cookbook:: apache
#
# Copyright:: 2017, The Authors, All Rights Reserved.

default["apache"]["sites"]["davidpickwell2"] = { "site_title" => "DavidP2s website is coming soon", "port" => 80, "domain" => "davidpickwell2.mylabserver.com" }
default["apache"]["sites"]["davidpickwell2b"] = { "site_title" => "DavidP2bs website is coming soon", "port" => 80, "domain" => "davidpickwell2b.mylabserver.com" }
default["apache"]["sites"]["davidpickwell3"] = { "site_title" => "DavidP3 website is coming soon", "port" => 80, "domain" => "davidpickwell3.mylabserver.com" }

default["author"]["name"] = "David"

case node["platform"]
when "centos"
	default["apache"]["package"] = "httpd"
when "ubuntu"
	default["apache"]["package"] = "apache2"
end
