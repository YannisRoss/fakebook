class UsersController < ApplicationController

    def show
        @friendship = Friendship.new
        @user=current_user
        redirect_unregistered
    end

    def index
        redirect_unregistered
        @post = Post.new
        @user=current_user
        unless @user.nil?
            @posts_to_show = []
            
            @user.posts.each do |post|
                @posts_to_show.push(post)
            end

            @user.friends.each do |friend|
                friend.posts.each do |post|
                    @posts_to_show.push(post)
                end
            end
            @user.inverse_friends.each do |friend|
                friend.posts.each do |post|
                    @posts_to_show.push(post)
                end
            end

          @posts_to_show = @posts_to_show.sort_by {|post| post.updated_at}.reverse
        end

        @friend_request = FriendRequest.new 
        @users = User.all
        @friendships = Friendship.all
        @comments = Comment.all



    end

    def redirect_unregistered
        unless current_user
            
            redirect_to new_user_registration_url
        end
    end
end
