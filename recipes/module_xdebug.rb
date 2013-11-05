pkg = "php5-xdebug"

package pkg do
  action :install
  notifies :restart, "service[php-fpm]", :delayed
end
