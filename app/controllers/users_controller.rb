class UsersController < ApplicationController

# this controller is to be used for signing up new users


def new
	# sign up form
	@user = User.new

end	



def create

	@user = User.new(user_params) # only creates record if all those fields required in user_params are filled out

	if @user.save
		flash[:success] = "You've signed up!"

		# this is the user of the site. the :uid is made up.
		# this gives the user a cookie containing their user_id

		session[:uid] = @user.id
		redirect_to root_path
	else

		render "new"
	end

end



def user_params
	params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)

end




end
