FactoryBot.define do
  factory :user do
    nickname              {"hanako"}
    email                 {Faker::Internet.free_email}
    password              {"1q2w3e4r"}
    password_confirmation {password}
    first_name_kan        {"あい"}
    family_name_kan       {"あい"}
    first_name_kana       {"アイ"}
    family_name_kana      {"アイ"}
    birth                 {"1991-04-01"}
  end
end