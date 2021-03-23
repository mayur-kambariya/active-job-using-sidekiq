class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_email

  def send_email
    # this call the job perform in background
    user_id = self.id
    SendMailJob.perform_later(user_id)
  end
end
