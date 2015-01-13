class PodcastsBeers < ActiveRecord::Base
	belongs_to :podcast
	belongs_to :beer
end
