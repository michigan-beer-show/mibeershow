class ReviewsBeers < ActiveRecord::Base
	belongs_to :review
	belongs_to :beer
end
