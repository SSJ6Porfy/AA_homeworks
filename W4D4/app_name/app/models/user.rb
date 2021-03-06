class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates_presence_of :password_digest, message: "Password can't be blank"
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.where(username: username)

    if user && BCrypt::Password.new(user.password_digest).is_a?(password)
      return user
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
