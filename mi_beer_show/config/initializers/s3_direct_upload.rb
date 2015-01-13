S3DirectUpload.config do |c|
	c.access_key_id = 	  ENV[:access_key_id]
	c.secret_access_key = ENV[:secret_access_key]
	c.bucket = 			  ENV[:bucket]
	c.region = 			  'us-east-1'
end