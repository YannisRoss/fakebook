class UsersController < ApplicationController

    def show
        if current_user
            @user=current_user
        else
            redirect_to new_user_registration_url
        end
    end

    def index

        @friend_request = FriendRequest.new
        @users = User.all
    end
end
