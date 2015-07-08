class HomeController < ApplicationController
	def index
		@podcast = Podcast.first
	end
end
