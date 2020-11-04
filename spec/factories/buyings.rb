FactoryBot.define do
  factory :buying do
    zip_code { '000-0000' }
    prefucture_id { 2 }
    city { '東京都' }
    address_line { '横浜市1-1' }
    building_name { 'タウン'}
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}
  end
end
