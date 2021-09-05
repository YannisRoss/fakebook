class FriendshipsController < ApplicationController

    def create
        @friendship = Friendship.new(friendship_params)

        @friend_request_to_delete = FriendRequest.find_by(requester_id: @friendship.user_id, target_id: @friendship.friend_id)
        
        unless @friend_request_to_delete.nil?
            @friend_request_to_delete.destroy
        end
        @friend_request_to_delete = FriendRequest.find_by(requester_id: @friendship.friend_id, target_id: @friendship.user_id)

        unless @friend_request_to_delete.nil?
            @friend_request_to_delete.destroy
        end
        respond_to do |format|
            if @friendship.save
              format.html { redirect_to root_url, notice: "Friend request was successfully accepted!" }
            else
                format.html { redirect_to root_url, notice: "Friend request not accepted!" }
            end
          
        end


    end

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
      end

end
