pear_module = "igbinary"

php_pear pear_module do
  action :install
  directives("session.serialize_handler" => "igbinary", "igbinary.compact_strings" => "On")
end

enable_pear_mod (pear_module)