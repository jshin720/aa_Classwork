class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  attr_reader :password

  before_validation :ensure_session_token
  # after_initialize :ensure_session_token

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    return self.session_token
  end

end
