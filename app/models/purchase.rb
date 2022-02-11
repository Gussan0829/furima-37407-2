class Purchase
  include ActiveModel::Model
  attr_accessor :user,:item

  validates :user, presence: true, foreign_key: true
  validates :item, presence: true, foreign_key: true
  
  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
