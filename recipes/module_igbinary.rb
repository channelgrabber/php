php_pear "igbinary" do
  action :install
  directives('session.serialize_handler' => 'igbinary', 'igbinary.compact_strings' => 'On')
end