node['php']['packages'].each do |pkg|
	apt_preference pkg do
		pin          'release n=trusty/main'
		pin_priority '1500'
	end
end
