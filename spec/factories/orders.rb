FactoryBot.define do
  factory :order do
    association :user
    post_code { "1234567" }
    address { "12" }
    name { "121" }
    payment { 1 }
  end
end
