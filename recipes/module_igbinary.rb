php_pear "igbinary" do
  action :install
end

script "configure_igbinary" do
  if {File.exists?('/etc/php5/conf.d/igbinary.ini')}
  interpreter "bash"
  user "root"
  code <<-EOH
    echo -e "session.serialize_handler=igbinary
    igbinary.compact_strings=On" >> /etc/php5/conf.d/mongo.ini
  EOH
end