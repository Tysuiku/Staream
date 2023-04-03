# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  validates :username,
    uniqueness: true,
    length: { in: 3..12 },
    format: { without: URI::MailTo::EMAIL_REGEXP, message: "can't be an email" }
  validates :email,
    uniqueness: true,
    length: { in: 3..100 },
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { in: 6..16 }, allow_nil: true

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return user if user && user.authenticate(password)
    false
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    self.save!
    session_token
  end

  private

  def generate_unique_session_token
    while true
      token = SecureRandom.urlsafe_base64
      return token unless User.exists?(session_token: token)
    end
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end
end
