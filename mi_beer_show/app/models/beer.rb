class Beer < ActiveRecord::Base
	has_many :podcasts, through: :podcasts_beers
end
