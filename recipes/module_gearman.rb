pear_module = "gearman"

include_recipe "gearman::server-source"
include_recipe "gearman::php"

PHP.enable_php_module (pear_module)