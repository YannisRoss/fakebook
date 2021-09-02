class UsersController < ApplicationController

    def show
        if current_user
            @user=current_user
        else
            redirect_to new_user_registration_url
        end
    end

    def index
        redirect_to "/users/#{current_user.id}" if current_user


        @users = User.all
    end
end
