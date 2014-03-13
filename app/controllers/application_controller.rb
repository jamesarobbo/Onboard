class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # the application controller handles everything across the site


  # make the current_user and logged_in? available in the views as well as the controllers

  helper_method :current_user
  helper_method :logged_in?


  def current_user
  	# this is who the user is signed in as

  	@current_user = User.find(session[:uid])

  end

  def logged_in?

  	# is the user logged in
  	# does the user have a cookie called uid?
  	session[:uid].present?


  end	



end
