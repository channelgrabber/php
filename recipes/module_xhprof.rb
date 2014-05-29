xhprof_dir = "/var/channelgrabber/xh_prof"

FileUtils.mkdir_p(xhprof_dir) unless File.exists?(xhprof_dir)

git xhprof_dir do
	repository "git://github.com/facebook/xhprof.git"
	revision "master"
	action :sync
end

bash 'install xhprof extension' do
	cwd xhprof_dir
	code <<-EOH
		phpize
		./configure --with-php-config={pathtophp-config} 
		make
		make install
		make test
		EOH
end
