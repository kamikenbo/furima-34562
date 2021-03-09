class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content
    validates :image
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 },
                      format: { with: /\A\d+\z/, message: '半角数字を使用してください' }
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to :shipping_day
  belongs_to :item_condition
end
