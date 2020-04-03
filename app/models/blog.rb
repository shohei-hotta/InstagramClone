class Blog < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :content, presence: true, length: { maximum: 150 }
end
