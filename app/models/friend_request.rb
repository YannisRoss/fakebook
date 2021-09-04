class FriendRequest < ApplicationRecord

    belongs_to :requester
    belongs_to :target

end
