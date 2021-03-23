class SendMailJob < ApplicationJob
  queue_as :default

  def perform(id)
    user = User.find_by(id: id)
    UserMailer.sending_email(user).deliver_later
  end
end
