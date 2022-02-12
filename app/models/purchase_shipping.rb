class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code,:prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :post_code  
    validates :municipality     
    validates :building_name
    validates :prefecture_id
    validates :purchase_id
    validates :user_id    
    validates :item_id    
  end

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :address
  end

  with_options presence: true, format: { with: /\A\d{10,11}\z/ } do
    validates :phone_number
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, municipality: municipality, address: address, building_name: building_name, prefecture_id: prefecture_id, phone_number: phone_number, purchase_id: purchase.id)
  end
end