FactoryBot.define do
  factory :item do
    name                  { Faker::Game }
    content               { 'これはサンプルです。' }
    category_id              { 2 }
    charge_id                { 2 }
    prefecture_id            { 2 }
    condition_id             { 2 }
    delivery_id              { 2 }
    price { 1000 }
    association :user
    after(:build) do |item|
      item.images.attach(io: File.open('app/assets/images/comment.png'), filename: 'comment.png')
    end
  end
end
