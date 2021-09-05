class UsersController < ApplicationController

    def show
        @friendship = Friendship.new

        if current_user
            @user=current_user
        else
            redirect_to new_user_registration_url
        end
    end

    def index
        @user=current_user
        @posts_to_show = @user.posts
        @user.friends.each do |friend|
            friend.posts.each do |post|
                @posts_to_show.push(post)
            end
        end


        @friend_request = FriendRequest.new 
        @users = User.all
        @friendships = Friendship.all
        @comments = Comment.all



    end


end
