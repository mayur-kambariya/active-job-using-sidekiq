class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.mailer[:user_name]

  def sending_email(user)
    @user = user
    mail(to: @user.email, subject: "Created User Account")
  end
end
