class Order
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_origin_id, :mayor_ward_village, :address, :building, :telephone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :mayor_ward_village
    validates :address
    validates :telephone_number, format: { with: /\d{10,11}/ }, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :shipping_origin_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    shipping = Shipping.create(post_code: post_code, shipping_origin_id: shipping_origin_id,
                               mayor_ward_village: mayor_ward_village, address: address, building: building, telephone_number: telephone_number,
                               purchase: purchase)
  end
end
