class BeersController < ApplicationController
	def index
		@beers = Beer.all
		respond_to do |format|
			format.html
			format.json
		end
	end

	def new

	end

	def create
	end
end
