class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture

  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :content, presence: true
  validates :charge_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :delivery_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }


  belongs_to :user

  has_many_attached :images

  has_one :purchase

  has_many :comments

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "を入力してください" }
  end
end
