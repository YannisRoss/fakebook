class FriendRequestsController < ApplicationController


    def create
        @friend_request = FriendRequest.new

        respond_to do |format|
            if @friend_request.save
              format.html { redirect_to root_url, notice: "Friend request was successfully sent!" }
            else
                format.html { redirect_to root_url, notice: "Friend request failed!" }
            end
          
        end


    end

        
end
