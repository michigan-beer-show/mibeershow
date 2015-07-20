class BeersController < ApplicationController
	def index
		@beers = Beer.all
		respond_to do |format|
			format.html
			format.json
		end
	end

	def new
		@beer = Beer.new(params[:beer])
		respond_to do |format|
			if @beer.save		
				format.html { redirect_to @beer }
				format.json
				format.js
			end
	end

	def create
	end
end
