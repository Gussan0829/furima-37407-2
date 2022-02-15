FactoryBot.define do
  factory :purchase_shipping do
    post_code                  { '123-4567' }
    municipality               { '大阪市' }
    address                    { '大正区'}
    building_name              { '建物名'}
    prefecture_id              { 2 }
    phone_number               { '09012345678' }
    token                      {"tok_abcdefghijk00000000000000000"}
  end
end
