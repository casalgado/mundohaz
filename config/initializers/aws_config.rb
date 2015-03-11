
if Rails.env.development?
	AWS = YAML.load_file("#{::Rails.root}/config/aws_config.yml")[::Rails.env]
	
	ENV['ACCESS'] = AWS['ACCESS']
	ENV['SECRET'] = AWS['SECRET']
	ENV['BUCKET'] = AWS['BUCKET']
end