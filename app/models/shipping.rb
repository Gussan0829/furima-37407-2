class Shipping
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase 

  validates :post_code    , presence: true
  validates :municipality , presence: true
  validates :address      , presence: true
  validates :building_name, presence: true
  validates :prefecture_id, presence: true
  validates :purchase     , presence: true, foreign_key: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end

