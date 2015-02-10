php_module = "mcrypt"

package "php5-#{php_module}" do
  action :install
end

enable_pear_mod(php_module)
