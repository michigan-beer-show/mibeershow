class Podcast < ActiveRecord::Base
	has_and_belongs_to_many :beers
	has_many :reviews, through: :beers
	validates :title, presence: true, uniqueness: true


end
