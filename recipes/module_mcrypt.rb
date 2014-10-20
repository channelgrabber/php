module = "mcrypt"

package "php5-#{module}" do
  action :install
end

enable_pear_mod(module)
