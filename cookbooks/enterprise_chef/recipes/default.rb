#
# Cookbook:: enterprise_chef
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
package_url = node['enterprise_chef']['url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"
#node['enterprise_chef']['package_path'] = '/var/chef/cache/private-chef-11.1.8-1.el6.x86_64.rpm'

#remote_file package_local_path do
#  source package_url
#end

package package_name do
    source package_local_path   
    provider Chef::Provider::Package::Rpm
    notifies :run, 'execute[reconfigure-chef-server]'
end

execute 'reconfigure-chef-server' do
    command 'private-chef-ctl reconfigure'
    action :nothing
end 
