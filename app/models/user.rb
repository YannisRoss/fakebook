class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[facebook]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        has_many :likes, dependent: :destroy
        has_many :posts, dependent: :destroy
        has_many :comments, through: :posts, dependent: :destroy
        has_many :friendships, dependent: :destroy ,dependent: :destroy
        has_many :friends, through: :friendships 
        has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id" , dependent: :delete_all
        has_many :inverse_friends, :through => :inverse_friendships, :source => :user 
        has_many :friend_requests, foreign_key: 'requester_id', dependent: :destroy, dependent: :delete_all
        has_many :friend_requests, foreign_key: 'target_id', dependent: :destroy, dependent: :delete_all


        has_one_attached :avatar

        after_create :send_welcome_email

    
        def send_welcome_email
          UserMailer.send_signup_email(self).deliver_later
        end


        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.name = auth.info.name   # assuming the user model has a name
            #user.avatar = auth.info.image # assuming the user model has an image
            # If you are using confirmable and the provider(s) you use validate emails, 
            # uncomment the line below to skip the confirmation emails.
            # user.skip_confirmation!
          end
        end
        
end
