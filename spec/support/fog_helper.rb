Fog.mock!
	# Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')
	connection = Fog::Storage.new(:provider => 'AWS', :aws_access_key_id => ENV['S3_KEY'], :aws_secret_access_key => ENV['S3_SECRET'],)
	connection.directories.create(:key => 'scfbesnapshot')