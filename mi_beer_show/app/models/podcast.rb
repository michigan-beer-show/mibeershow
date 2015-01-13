class Podcast < ActiveRecord::Base
	
	has_many :beers, :through => :podcasts_beers
	has_many :scores
	validates :title, :description, :subtitle, :resource_url, :length, presence: true
	has_attached_file :episode,
					  :storage => :s3,
					  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
	validates_attachment_content_type :episode, :content_type => /\A*.(mp3)\z/
	validates_attachment_presence :episode

	def truncate
		subtitle = self.description.slice(0..121)
		return subtitle
	end

	def s3_credentials
		{:bucket => ENV['BUCKET'], :access_key_id => ENV['ACCESS_KEY_ID'], :secret_access_key => ENV['SECRET_ACCESS_KEY']}
	end
end
