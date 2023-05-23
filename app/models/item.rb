class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_origin
  belongs_to :derivary

  validates :product_name, :string, presence: true
  validates :description, :integer, presence: true
  validates :category, :integer, presence: true
  validates :condition, :integer, presence: true
  validates :price, :integer, presence: true
  validates :shipping_charge, :integer, presence: true
  validates :shipping_origin, :integer, presence: true
  validates :derivary, :integer, presence: true

  validates :categiry_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_origin_id, numericality: { other_than: 1 } 
  validates :derivary_id, numericality: { other_than: 1 } 

end
