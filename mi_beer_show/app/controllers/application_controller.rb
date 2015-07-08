require 'mailchimp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_mcapi

  include SessionsHelper

  def setup_mcapi
  	@mc = Mailchimp::API.new('35be6013fe2b8655773386813e566846-us11')
  	@list_id = "99d0e51797"
  end
end
