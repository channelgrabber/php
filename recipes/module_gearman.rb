pear_module = "gearman"

include_recipe "gearman::server-source"
include_recipe "gearman::php"

Chef::Log.error "******************** about to call eneable pear mod"
enable_pear_mod (pear_module)

