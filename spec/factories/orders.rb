FactoryBot.define do
  factory :order do
    post_code { '123-1234' }
    shipping_origin_id { 3 }
    mayor_ward_village { '横浜市緑区' }
    address { '3-4' }
    building { '青山ビル' }
    telephone_number { '09012341234' }
  end
end
