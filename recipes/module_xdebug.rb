module_name = "xdebug"
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

log "**** About to start enabled check"

if ((!node['php']['modules']['xdebug']['enabled'].nil?) rescue false) # TODO check if this eats all errors (like in disable_mod)
  log "**** Attribute is not nil"
  if (!node['php']['modules']['xdebug']['enabled'])
    log "**** Attribute is disabled. Disabling..."
    disable_mod(module_name)
  else
    enable_mod(module_name)
  end
end