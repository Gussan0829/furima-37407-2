class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code,:prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :address 
    validates :municipality     
    validates :prefecture_id
    validates :user_id    
    validates :item_id    
    validates :token
  end

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :post_code 
  end

  with_options presence: true, format: { with: /\A\d{10,11}\z/ } do
    validates :phone_number
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, municipality: municipality, address: address, building_name: building_name, prefecture_id: prefecture_id, phone_number: phone_number, purchase_id: purchase.id)
  end
end