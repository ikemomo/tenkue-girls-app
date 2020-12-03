class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  email_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  password_format = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :name, presence: true
  validates :email, format: { with: email_format }
  validates :password, format: { with: password_format }, length: { in: 8..32 }
  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(name: 'ゲストユーザ', email: 'guest@example.com' ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
