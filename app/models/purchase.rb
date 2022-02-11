class Purchase
  include ActiveModel::Model
  attr_accessor :user,:item

  with_options presence: true, foreign_key: true do
    validates :user
    validates :item
  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end

  belongs_to :item
  belongs_to :user
  has_one :shipping
  
end
