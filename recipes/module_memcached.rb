pkg = "php5-memcached"

package pkg do
  version node['php']['memcached']['version']
  action :install
end
