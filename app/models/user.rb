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
  validates :username, :email, :session_token, presence: true
  validates :username, length: { in: 3..16 },
                       format: { without: URI::MailTo::EMAIL_REGEXP, message: "can't be an email" }
  validates :password,
            length: { in: 6..24 },
            allow_nil: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation :ensure_session_token

  has_many :cart_items
  has_many :owned_games, -> { where(cart_items: { purchased: true }) }, through: :cart_items, source: :game
  has_many :reviews, foreign_key: :author_id

  def owns?(game)
    cart_items.exists?(game_id: game.id, purchased: true)
  end

  def self.find_by_credentials(credential, password)
    if URI::MailTo::EMAIL_REGEXP.match(credential)
      user = User.find_by(email: credential)
    else
      user = User.find_by(username: credential)
    end
    return user if user && user.authenticate(password)
    false
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    self.update!({ session_token: self.session_token })
    session_token
  end

  private

  def generate_unique_session_token
    token = SecureRandom::urlsafe_base64
    while User.exists?(session_token: token)
      token = SecureRandom::urlsafe_base64
    end
    token
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end
end
