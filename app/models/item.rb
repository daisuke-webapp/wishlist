class Item < ApplicationRecord
  belongs_to :user
  
  validates :image_url, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :price, presence: true, length: { maximum: 255 }
  validates :item_code, presence: true, length: { maximum: 255 }
end
