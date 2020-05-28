FactoryBot.define do
  factory :cart do
    association :user
    association :product
    number { 123 }
  end
end
