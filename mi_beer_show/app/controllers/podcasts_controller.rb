class PodcastsController < ApplicationController
	def index
		@podcasts = Podcast.all
	end

	def new
		@podcast = Podcast.new
		@beers = Beer.all
		
		s3 = AWS::S3.new
		bucket = s3.buckets[ENV['AWS_BUCKET']]
		@audio_files = []
		bucket.objects.each do |obj|
			@audio_files << obj.key
		end
	end
	
	def create
		@podcast = Podcast.new(podcast_params)

		if @podcast.save
			redirect_to podcast_show_path(@podcast.id)
		else
			render 'new'
		end
	end

	def show
		@podcast = Podcast.find(params[:id])
	end

	def edit
		if current_user
			@podcast = Podcast.find(params[:id])
		else
			redirect_to signin_path
		end
	end

	def update
		if current_user
			@podcast = Podcast.find(params[:id])
		else
			redirect_to signin_path
		end
		@podcast.attributes = podcast_params
		if @podcast.save
			redirect_to action: "show", id: @podcast.id
		else
			flash.now[:error] = "Dang, something went wrong. Try again."
			render :edit
		end
	end

	def feed
		@podcasts = Podcast.all
		respond_to do |format|
			format.html
			format.rss
		end
	end

	private

	def podcast_params
		params.require(:podcast).permit(:title, :description)
	end
end
