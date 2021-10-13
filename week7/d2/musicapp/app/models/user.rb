class User < ApplicationRecord
  attr_reader: :password
  before_validation :ensure_session_token

  validates :email, :session_token, uniqueness: true, presence: null
  validates :password_digest presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) #sets the password digest from the given password
  end

  def self.generate_session_token
    self.session_token ||= SecureRandom::urlsafe_base64 
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.is_valid_password?(password)
      return user     
    else
      nil
    end

  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64 # used before the validation  #if we dont have have one, we are going to set a new session_token
end
