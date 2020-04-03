class User < ApplicationRecord
  has_secure_password
  has_many :blogs
  has_one_attached :profile_image
end
