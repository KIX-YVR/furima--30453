FactoryBot.define do
  factory :item do
    name { 'a' }
    explanation { 'a' }
    category_id { 2 }
    condition_id { 2 }
    who_pays_delivery_fee_id { 2 }
    from_where_to_send_id { 2 }
    how_long_does_it_take_to_send_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image1.png'), filename: 'outpit-image1.png')
    end
  end
end
