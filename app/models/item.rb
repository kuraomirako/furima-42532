class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time
  has_one :purchase

  ActiveHash::Associations
  has_one_attached :image

  validates :product, presence: true
  validates :description, presence: true
  validates :price,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999
            }

  validates :image, presence: true
  validates :category_id, :condition_id, :delivery_time_id, :prefecture_id, :shipping_fee_id,
            numericality: { other_than: 1, message: "can't be blank" }

  def sold_out?
  end
end