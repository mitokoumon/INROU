FactoryBot.define do
  factory :user do
    email { "1@1" }
    family_name { "aaa" }
    last_name { "aaa" }
    family_name_kana { "aaa" }
    last_name_kana { "aaa" }
    post_code { "1234567" }
    address { "124" }
    telephone_number { "123" }
    flag { 1 }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
