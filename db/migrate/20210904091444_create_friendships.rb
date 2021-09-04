class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    drop_table :friendships

    create_table :friendships do |t|

      t.timestamps
    end

  end
end
