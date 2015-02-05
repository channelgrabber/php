pkg = "php5-memcached"

package pkg do
  version node['php']['memcached']['version']
  options "--assume-no"
  action :install
end
