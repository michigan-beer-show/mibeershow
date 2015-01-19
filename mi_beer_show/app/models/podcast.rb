class Podcast < ActiveRecord::Base
	
	has_and_belongs_to_many :beers
	# validates :title, :description, :subtitle, :resource_url, :length, presence: true
	has_attached_file :episode,
					  :storage => :s3,
					  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

	after_update :truncate

	def truncate
		self.subtitle = self.description.slice(0..121)
	end

	def s3_credentials
		{:bucket => ENV['BUCKET'], :access_key_id => ENV['ACCESS_KEY_ID'], :secret_access_key => ENV['SECRET_ACCESS_KEY']}
	end
end
