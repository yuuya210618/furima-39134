class Order
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_origin_id、:mayor_ward_village, :address, :building, :telephone number, :user_id, :item_id
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :mayor_ward_village 
    validates :address
    validates :building
    validates :telephone_number, format: {with: /\d{10,11}/}, length: {maximum: 11}
    validates :user_id
    validates :item_id
  end
  validates :shipping_origin_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id:user_id, item_id:item_id)
    Delivery.create(post_code: post_code, shipping_origin_id: shipping_origin_id, mayor_ward_village: mayor_ward_village, address: address, building: building, user_id: user_id, item_id: item_id)
  end
end