class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :category
  # belongs_to :charge
  # belongs_to :condition
  # belongs_to :delivery
  # belongs_to :prefecture

  # validates :name, presence: true
  # validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :content, presence: true
  # validates :charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :image, presence: true

  # belongs_to :user

  # has_one_attached :image


  # with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  #   validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  #                     presence: { message: "can't be blank" }
  # end
end


