FactoryBot.define do
  factory :ordered_product do
    association :order
    # user { order.user }
    association :product
    # category { product.category }
    number { 7 }
    price { 1 }
    flag { 1 }
  end
end
