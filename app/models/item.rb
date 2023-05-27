class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true, unless: :was_attached?

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_origin
  belongs_to :derivary

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :shipping_charge, presence: true
  validates :shipping_origin, presence: true
  validates :derivary, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_origin_id, numericality: { other_than: 1 }
  validates :derivary_id, numericality: { other_than: 1 }

  def was_attached?
    image.attached?
  end
end
