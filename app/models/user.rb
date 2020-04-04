class User < ApplicationRecord
  has_secure_password
  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog
  has_one_attached :profile_image

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation,  presence: true
end
