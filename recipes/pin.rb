node['php']['packages'].each do |pkg|
	apt_preference pkg do
		pin          '5.5.9+dfsg-1ubuntu4.4'
		pin_priority '1500'
	end
end
