FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 1)}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6,)}  
    password_confirmation  {password}
    first_name            {"高橋"}
    last_name             {"良彰"}
    first_name_kana       {"タカハシ"}
    last_name_kana        {"ヨシアキ"}
    birthday              {Faker::Date.between(from: '1930-1-1', to: '2015-12-31')}
  end
end