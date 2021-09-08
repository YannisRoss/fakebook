class RegistrationsController < Devise::RegistrationsController

    def create
      super
      UserNotifierMailer.send_signup_email(current_user).deliver unless current_user.invalid?
    end
  
  end