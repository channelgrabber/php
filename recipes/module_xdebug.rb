pkg = "php5-xdebug"



package pkg do
  action :install
  notifies :restart, "service[php-fpm]", :delayed
  #notifies :run, "execute[configure_xdebug]"
end

bash "configure_xdebug" do
  user "root"
  cwd "/etc/php5/mods-available"
  code <<-EOH
    echo '[xdebug]
    xdebug.remote_enable=1
    xdebug.remote_connect_back=1
    xdebug.idekey=PHPSTORM
    xdebug.profiler_enable=1
    xdebug.profiler_enable_trigger=1' >> xdebug.ini
  EOH
  action :run
end