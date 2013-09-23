php_pear_channel 'pear.php.net' do
  action :update
end
php_pear_channel 'pecl.php.net' do
  action :update
end

# Install gearman pecl package
php_pear "memcached" do
  version node['php']['memcached']['version']
  action :install
  not_if "php --info | grep -qs 'gearman support => enabled'"
end