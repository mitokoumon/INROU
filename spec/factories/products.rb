FactoryBot.define do
  factory :product do
    association :category
    name { "aaa" }
    image_id { "1234567" }
    now_price { 123 }
    text { "aaa" }
    flag { 1 }
  end
end
