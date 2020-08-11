FactoryBot.define do
  factory :item do
    item                  { Faker::Name.initials(number: 1) }
    text                  { Faker::Lorem.sentence}
    image                 { Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    status_id             {Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id       {Faker::Number.between(from: 2, to: 3)}
    area_id               {Faker::Number.between(from: 2, to: 48)}
    day_id                {Faker::Number.between(from: 2, to: 4)}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    association  :user
  end
end
