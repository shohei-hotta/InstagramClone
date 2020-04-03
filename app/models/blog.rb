class Blog < ApplicationRecord
  has_one_attached :image

  validates :content, presence: true, length: { maximum: 150 }
end
