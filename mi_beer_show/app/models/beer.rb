class Beer < ActiveRecord::Base
	has_and_belongs_to_many :podcasts
	has_and_belongs_to_many :reviews
	has_many :scores

	accepts_nested_attributes_for :scores
end
