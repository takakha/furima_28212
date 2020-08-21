FactoryBot.define do
  factory :order_address do
    postcode          { '050-3344' }
    prefecture_id     { '5' }
    city              { '京都市' }
    block             { '5-9' }
    building          { '古里' }
    phone_number      { '22222222222' }
    user_id           { '10' }
    item_id           { '10' }
  end
end
