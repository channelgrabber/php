path = '/etc/php5/pecl/phpiredis-1.0.0'

package ['re2c', 'libhiredis-dev']

directory path do
  recursive true
  action :create
end

remote_file "#{path}.tgz" do
  source 'https://api.github.com/repos/nrk/phpiredis/tarball/v1.0.0'
  action :create
end

execute "tar --extract --file=#{path}.tgz --strip-components=1 --skip-old-files" do
  cwd path
  action :run
end

execute "pecl phpiredis:1.0.0 install" do
  command <<-EOF
    set -e
    phpize --clean
    phpize
    ./configure --enable-phpiredis
    make
    make install
    echo "extension=phpiredis.so" > /etc/php5/mods-available/phpiredis.ini
    php5enmod phpiredis
  EOF
  cwd path
  action :run
  not_if "[ \"`php -r 'echo phpversion(\"phpiredis\");'`\" = \"1.0.0\" ]"
end