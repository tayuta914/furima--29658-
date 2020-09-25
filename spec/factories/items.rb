FactoryBot.define do
  factory :item do
    name {"a"}
    text {"aa"}
    category_id {2}
    condition_id {2}
    shipping_charge_id {2}
    prefecture_id {0}
    day_ship_id {2}
    price {300}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end