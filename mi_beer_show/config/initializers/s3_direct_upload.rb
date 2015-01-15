S3DirectUpload.config do |c|
	c.access_key_id = Rails.configuration.aws[:AWS_ACCESS_KEY_ID]
	c.secret_access_key = Rails.configuration.aws[:AWS_SECRET_ACCESS_KEY]
	c.bucket = Rails.configuration.aws[:BUCKET]
	c.region = 'us-east-1'
end