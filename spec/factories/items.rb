FactoryBot.define do
  factory :item do
    product_name        { Faker::Name.initials }
    description         { Faker::Lorem.sentence }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    condition_id        { Faker::Number.between(from: 2, to: 7) }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    shipping_charge_id  { Faker::Number.between(from: 2, to: 4) }
    shipping_origin_id  { Faker::Number.between(from: 2, to: 48) }
    derivary_id         { Faker::Number.between(from: 2, to: 3) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
