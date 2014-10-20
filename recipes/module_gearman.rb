pear_module = "gearman"

include_recipe "gearman::server-source"
include_recipe "gearman::php"

enable_php_module (pear_module)