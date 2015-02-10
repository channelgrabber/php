pear_module = "mongo"

php_pear pear_module do
  options "--assume-no"
  action :upgrade
end

enable_pear_mod (pear_module)
