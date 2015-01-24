class ReviewsController < ApplicationController
	def new
		if current_user
			@review = Review.new
		else
			redirect_to signin_path
		end
	end

	def create
		@review = Review.new(review_params)
		if @review.save
			redirect_to review_show_path(@review.id)
		else
			render "new"
		end
	end

	def show
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, hard_wrap: true)
		@review = Review.find(params[:id])
	end

	def index
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def review_params
		params.require(:review).permit(:body)
	end

end