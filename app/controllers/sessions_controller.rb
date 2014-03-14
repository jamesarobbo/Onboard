class SessionsController < ApplicationController

	def new
		# log in form


	end

	def create
		# actually log in
		#try and find a user with the username submitted, if there is one and their password matches sign them in and give them a session
		# if not, show the form again

		# the simple_form has a :session and inside that a :username and a :password
		@username = params[:session][:username]
		@password = params[:session][:password]

		@user = User.find_by_username(@username)

		# if there isn't a user with the username used, maybe check and see if there's a user with that email

		if @user.nil?

			@user = User.find_by_email(@username)
		end	
			



		if @user.present? and @user.authenticate(@password)
			# if username and password authenticates with that user sign user in
		flash[:success] = "You are now logged in"
		session[:uid] = @user.id
		redirect_to root_path

		else
			flash[:error] = "Your details are incorrect"
			render "new"

		end




	end

	def destroy
		# log out
		# this basically means remove the seeiosn from the user

		reset_session
		flash[:success] = "You are now logged out"

		redirect_to root_path

	end




end
