class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :product_image
end
