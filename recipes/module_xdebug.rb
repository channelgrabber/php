pkg = "php5-xdebug"

bash "configure_xdebug" do
  user "root"
  cwd "/etc/php5/mods-available"
  code <<-EOH
echo 'xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.idekey=PHPSTORM
xdebug.profiler_enable=1
xdebug.profiler_enable_trigger=1' >> xdebug.ini
  EOH
  action :nothing
end

package pkg do
  action :install
  notifies :run, "bash[configure_xdebug]"
  if node.recipe?('php-fpm')
    notifies :restart, "service[php-fpm]", :delayed
  end
end