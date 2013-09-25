php_pear_channel 'pear.php.net' do
  action :update
end
php_pear_channel 'pecl.php.net' do
  action :update
end

# Install pecl_http
php_pear "pecl_http" do
  action :install
end