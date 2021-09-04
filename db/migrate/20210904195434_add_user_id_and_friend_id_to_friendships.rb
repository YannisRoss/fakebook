class AddUserIdAndFriendIdToFriendships < ActiveRecord::Migration[6.1]
  def change


    add_column :friendships, :user_id, :integer
    add_column :friendships, :friend_id,:integer

  end
end
