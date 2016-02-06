class Beer < ActiveRecord::Base
	has_and_belongs_to_many :podcasts
	has_many :reviews
end
