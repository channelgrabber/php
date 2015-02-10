php_module = "mcrypt"

package "php5-#{php_module}" do
  options "--assume-no"
  action :upgrade
end

enable_pear_mod(php_module)
