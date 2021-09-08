class RegistrationsController < Devise::RegistrationsController

    def create
      super
      UserNotifierMailer.send_signup_email(@user).deliver unless @user.invalid?
    end
  
  end