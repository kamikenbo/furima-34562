FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    category_id {1}
    item_condition_id {1}
    shipping_cost_id {1}
    prefecture_id {1}
    shipping_day_id {1}
    price { Faker::Lorem.sentence }
    

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
