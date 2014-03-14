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

  # this is authorisation. above is authentication

  def make_sure_logged_in

    # if not logged in, redirect to log in page

    if not logged_in?
      flash[:error] = "You must be logged in to see that page"
      redirect_to new_session_path

    end



  end




end
