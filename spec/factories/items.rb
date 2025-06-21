FactoryBot.define do
  factory :item do
    product          { Faker::Commerce.product_name }
    description      { Faker::Lorem.paragraph(sentence_count: 2) }
    category_id      { rand(2..11) }
    condition_id     { rand(2..7) }
    shipping_fee_id  { rand(2..3) }
    prefecture_id    { rand(2..48) }
    delivery_time_id { rand(2..4) }
    price            { rand(300..9_999_999) }

  association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
