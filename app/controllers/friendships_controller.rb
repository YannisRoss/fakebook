class FriendshipsController < ApplicationController

    def create
        @friendship = Friendship.new(friendship_params)

        respond_to do |format|
            if @friendship.save
              format.html { redirect_to root_url, notice: "Friend request was successfully accepted!" }
            else
                format.html { redirect_to root_url, notice: "Friend request not accepted!" }
            end
          
        end


    end

    def friendship_params
        params.require(:friend_request).permit(:user_id, :friend_id)
      end

end
