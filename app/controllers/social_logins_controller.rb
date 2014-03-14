class SocialLoginsController < ApplicationController

    def create

        # 1. get the social login details from the provider
        # 2. check to see if the details match any user in our database who previously signed in using social login
        # 3. if they are in there, sign them in, if not sign them up as a new user using their social login details

        @details = request.env["omniauth.auth"] # taken from omniauth github site

        @provider = @details["provider"]
        @provider_id = @details["uid"]

        @user = User.where(provider: @provider, provider_id: @provider_id).first

        if @user.present?
            # sign them in



        else
            # make a new user in the database
            @user = User.new
            @user.provider = @provider
            @user.provider_id = @provider_id

            # this is because of has_secure_password
            @user.password = "!!!!@@@@@£££££"
            @user.password_confirmation = "!!!!@@@@@£££££"

            # let's save the key and secret

            @user.key = @details["credentials"]["token"]
            @user.secret = @details["credentials"]["secret"]

            # let's fill in the users other details in the database

            @user.name = @details["info"]["name"]
            @user.email = @details["info"]["email"]

            @user.save # this will fail because we're not saving a username. to stop this from failing we need to stop the validtion from checking the username

        end


        session[:uid] = @user.id

        flash[:success] = "You've logged in"
        redirect_to root_path



    end


end
