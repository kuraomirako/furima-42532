FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '荒川区' }
    address { '1-1' }
    building_name { '荒川ハイツ' }
    phone_number { '09000000000' }
    token { 'tok_abcdefghijk00000000000000' }
  end
end