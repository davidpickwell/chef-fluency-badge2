#
# Cookbook:: mysql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'mysql-server' do
	action :install
end

package 'mysql' do
	action :install
end
