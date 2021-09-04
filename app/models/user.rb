class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :posts
        has_many :comments, through: :posts
        has_many :friendships, dependent: :destroy
        has_many :friends, through: :friendships
        has_many :friend_requests, foreign_key: 'requester_id', dependent: :destroy
        has_many :friend_requests, foreign_key: 'target_id', dependent: :destroy

end
