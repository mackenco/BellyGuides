class User < ActiveRecord::Base
  attr_accessible :username, :password, :email, :profile_pic
  attr_reader :password

  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true
  validates :username, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :username, use: :slugged

  after_initialize :ensure_session_token

  has_many(
    :maps,
    class_name: "Map",
    foreign_key: :owner_id,
    primary_key: :id)

  has_many :restaurants, through: :maps, source: :restaurants

  has_many :favorites

  has_many :favorited_maps, through: :favorites, source: :map

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_attached_file :profile_pic, styles: {
    big: "600x600>",
    small: "50x50#",
    very_small: "30x30#"
    }, default_url: {'public/images/seeds/Michelin-man.jpg'}

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
