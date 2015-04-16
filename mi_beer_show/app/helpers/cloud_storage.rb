module CloudStorage
	require 'google/api_client'
	# Set the name of the bucket you want to access
	BUCKET = 'mibeershow.appspot.com'

	# Load credentials from p12 file
	keypath = Rails.root.join('config', 'mibeershow.p12')
	KEY = Google::APIClient::KeyUtils.load_from_pkcs12(keypath, 'notasecret')

	# Create new OAuth client. This will allow you to receive a token
	def self.get_all_files
		auth_client = Signet::OAuth2::Client.new(
			:token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
			:audience             => 'https://accounts.google.com/o/oauth2/token',
			:scope                => 'https://www.googleapis.com/auth/devstorage.full_control',
			:issuer               => ENV['google_storage_email'],
			:signing_key          => KEY)

		# Gets the token
		auth_client.fetch_access_token!

		# This creates a new client that allows you to make requests to multiple APIs.
		# application_name and version are somewhat arbitrary in this scenario
		api_client = Google::APIClient.new(
			:application_name => 'Michigan Beer Show',
			:application_version => '1.0.0'
		)

		# Specify an API. You can also pass in a specific version if you like
		storage = api_client.discovered_api('storage')

		# List all items in bucket
		result = api_client.execute(
			:api_method => storage.objects.list,
			:parameters => { bucket: BUCKET },
			:authorization => auth_client
			)
	end

	def self.get_file(object)
		auth_client = Signet::OAuth2::Client.new(
			:token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
			:audience             => 'https://accounts.google.com/o/oauth2/token',
			:scope                => 'https://www.googleapis.com/auth/devstorage.full_control',
			:issuer               => ENV['google_storage_email'],
			:signing_key          => KEY)

		# Gets the token
		auth_client.fetch_access_token!

		# This creates a new client that allows you to make requests to multiple APIs.
		# application_name and version are somewhat arbitrary in this scenario
		api_client = Google::APIClient.new(
			:application_name => 'Michigan Beer Show',
			:application_version => '1.0.0'
		)

		storage = api_client.discovered_api('storage')

		result = api_client.execute(
			:api_method => storage.objects.get,
			:parameters => { bucket: BUCKET, object: object },
			:authorization => auth_client
			)
	end

	def self.upload_file(file_name)
		auth_client = Signet::OAuth2::Client.new(
			:token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
			:audience             => 'https://accounts.google.com/o/oauth2/token',
			:scope                => 'https://www.googleapis.com/auth/devstorage.full_control',
			:issuer               => ENV['google_storage_email'],
			:signing_key          => KEY)

		# Gets the token
		auth_client.fetch_access_token!

		# This creates a new client that allows you to make requests to multiple APIs.
		# application_name and version are somewhat arbitrary in this scenario
		api_client = Google::APIClient.new(
			:application_name => 'Michigan Beer Show',
			:application_version => '1.0.0'
		)

		storage = api_client.discovered_api('storage')

		media = Google::APIClient::UploadIO.new(file_name, 'audio/mpeg')
		metadata = {
			'title' => 'file_name'
		}

		# List all items in bucket
		result = api_client.execute(
			:api_method => storage.objects.insert,
			:parameters => {'uploadType' => 'resumable', 'bucket' => bucket, 'name' => 'iTunes-Cover'},
			:body_object => metadata,
			:media => media,
			:authorization => auth_client
			)

		upload = result.resumable_upload

		if upload.resumable?
			client.execute(upload)
		end
	end
end