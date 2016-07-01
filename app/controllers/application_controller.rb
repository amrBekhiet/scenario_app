class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  	def authenticate_user
  		if session[:user_id]
  			@current_user = User.find(session[:user_id])
  			return true 
  		else
  			redirect_to '/home/new'
  			return false 
  		end
  	end
  	def not_available_for_user
  		if session[:user_id]
  			redirect_to '/users/profile'
  			return false 
  		else
  			return true
  		end
  	end
end
