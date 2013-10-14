pear_module = "pecl_http"

php_pear pear_module do
  action :install
end

enable_pear_mod (pear_module)
