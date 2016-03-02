class ToolsController < ApplicationController
	def show
		render template: "tools/#{params[:tool]}"
	end
end
