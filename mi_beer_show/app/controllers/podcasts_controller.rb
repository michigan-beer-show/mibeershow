class PodcastsController < ApplicationController
	def index
		@podcasts = Podcast.all
	end

	def create
		@podcast = Podcast.create(params[:podcast])
	end

	def feed
		@podcasts = Podcast.all

		respond_to do |format|
			format.html
			format.rss
		end
	end
end
