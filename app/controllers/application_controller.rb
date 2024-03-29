class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  
  
  respond_to :html, :json
end
