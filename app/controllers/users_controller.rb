class UsersController < ApplicationController

    def show
        @friendship = Friendship.new
        @user=User.find(params[:id])
        redirect_unregistered
    end

    def index
        redirect_unregistered
        @post = Post.new
        @like = Like.new
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

    

    def edit
        @user=current_user
    end

    def update
        if @user.update(user_params)
            UserNotifierMailer.send_data_email(@user).deliver

            format.html { redirect_to @user, notice: "user was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
    end

    def redirect_unregistered
        unless current_user
            
            redirect_to new_user_registration_url
        end
    end
    private
    def user_params
        params.require(:user).permit(:email, :name)
      end

end
