FactoryBot.define do
  factory :management_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'fghijk00000000000000000' }
  end
end
