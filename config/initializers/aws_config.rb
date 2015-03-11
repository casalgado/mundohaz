
if Rails.env.development?
	AWS = YAML.load_file("#{::Rails.root}/config/aws_config.yml")[::Rails.env]
end