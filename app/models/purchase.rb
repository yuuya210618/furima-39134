class Purchase
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_origin_id、:municipalities, :address, :building_name, :telephone number, :token, :user_id, :item_id
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :building_name
    validates :telephone_number, format: {with: /\d{10,11}/}, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :shipping_origin_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id:user_id, item_id:item_id)
    Purchase.create(post_code: post_code, shipping_origin_id: shipping_origin_id, municipalities: municipalities, address: address, building_name: building_name, user_id: user_id, item_id: item_id)
  end
end