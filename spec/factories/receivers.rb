FactoryBot.define do
  factory :receiver do
    association :user
    post_code { "1234567" }
    address { "aaa" }
    name { "aaa" }
  end
end