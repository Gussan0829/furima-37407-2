class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user,:item, :post_code,:prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase 

  with_options presence: true do
    validates :post_code  
    validates :municipality
    validates :address      
    validates :building_name
    validates :prefecture_id
    validates :purchase, foreign_key: true
    validates :user, foreign_key: true
    validates :item, foreign_key: true
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, municipality: municipality, address: address, building_name: building_name, prefecture_id: prefecture_id, purchase: purchase_id, purchase.id)
  end
end