# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  attr_reader :password
  after_initialize :ensure_token
  validates :name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  has_many :subs,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :Sub

  def self.find_by_credentials(name, password)
    user = User.find_by(name: name)
    return nil if user.nil?
    user.is_valid_password?(password) ? user : nil
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
  
end
