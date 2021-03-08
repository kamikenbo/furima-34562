FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    category_id{Faker::Lorem.sentence}
    item_condition_id{Faker::Lorem.sentence}
    shipping_cost_id{Faker::Lorem.sentence}
    prefecture_id{Faker::Lorem.sentence}
    shipping_day_id{Faker::Lorem.sentence}
    price{Faker::Lorem.sentence}






    association :user 
  
  end
end
