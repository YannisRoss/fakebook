class AddForeignKeysToFriendRequests < ActiveRecord::Migration[6.1]
  def change

    add_column :friend_requests, :requester_id, :integer
    add_column :friend_requests, :target_id, :integer

    add_foreign_key :friend_requests, :users, column: :requester_id
    add_foreign_key :friend_requests, :users, column: :target_id

  end
end
