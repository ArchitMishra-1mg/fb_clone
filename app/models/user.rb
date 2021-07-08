class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :picture, as: :imageable, dependent: :destroy
  validates :name, presence: true
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :mob_no, presence: true,
                     length: { minimum: 10, maximum: 10 },
                     uniqueness: true
  validates :password_digest, presence: true,
                              length: {minimum: 6}
  has_secure_password
end
