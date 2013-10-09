class User < ActiveRecord::Base
  attr_accessible :username, :password, :email
  attr_reader :password

  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 2, allow_nil: true }
  validates :session_token, presence: true
  validates :username, presence: true

  after_initialize :ensure_session_token

  has_many(
    :maps,
    class_name: "Map",
    foreign_key: :owner_id,
    primary_key: :id)

  has_many :restaurants, through: :maps, source: :restaurants

  has_many :favorites

  has_many :favorited_maps, through: :favorites, source: :map

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
