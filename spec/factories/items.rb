FactoryBot.define do
  factory :item do
    item                  { Faker::Name.initials(number: 1) }
    text                  { Faker::Lorem.sentence }
    image                 { Faker::Lorem.sentence }
    category_id           { 3 }
    status_id             { 3 }
    delivery_fee_id       { 3 }
    area_id               { 3 }
    day_id                { 3 }
    price                 { 500 }
    association :user
  end
end
