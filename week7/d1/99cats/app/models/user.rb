class User < ApplicationRecord
  before_validation :ensure_session_token
  # after_initialize :ensure_session_token
  
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  
  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username) # check username column in table for input username
    if user && user.is_password?(password)
      return user
    else
      return nil
    end
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    return self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) # creates a BCrypt string object that is stored in db
    @password = password
  end

  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

end
