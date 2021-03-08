class Item < ApplicationRecord
  
  with_options presence: true  do
  validates :title
  validates :content
  validates :image
  end

  validates :price, presence: true, format: { with: /\A[\d]+\z/, message: '半角数字を使用してください' } 

  with_options numericality: { other_than: 1 } do
  validates :category_id, presence:true
  validates :item_condition_id, presence:true
  validates :shipping_cost_id, presence:true
  validates :prefecture_id, presence:true
  validates :shipping_day_id, presence:true
  end
      
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to :shipping_day
  belongs_to :item_condition
  belongs_to :user
  has_one_attached :image
      
     
      
      

end
