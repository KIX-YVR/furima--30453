FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    family_name { '田中' }
    first_name { '太郎' }
    family_name_kana { 'たなか' }
    first_name_kana { 'たろう' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    birthday { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
