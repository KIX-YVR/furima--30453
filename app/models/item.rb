class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :from_where_to_send
  belongs_to_active_hash :how_long_does_it_take_to_send
  belongs_to_active_hash :who_pays_delivery_fee
  belongs_to :user
  has_one :purchase_info 
  has_one_attached :image
    with_options presence: true do
        validates :name
        validates :explanation
        validates :category_id
        validates :condition_id
        validates :who_pays_delivery_fee_id
        validates :from_where_to_send_id
        validates :how_long_does_it_take_to_send_id
        validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "範囲外の数字です"}
        validates :user
        validates :image
    end
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :who_pays_delivery_fee_id
      validates :from_where_to_send_id
      validates :how_long_does_it_take_to_send_id
    end


end
