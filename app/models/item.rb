class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day_ship
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, :name, :text, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :day_ship_id, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :day_ship_id, numericality: {other_than: 1}
  validates_inclusion_of :price, in: 300..9_999_999
end
