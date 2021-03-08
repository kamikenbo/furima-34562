require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品投稿できない時' do
        
        it 'titleが空では登録できない' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it 'contentが空では登録できない' do
          @item.content = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end
        it 'priceが半角数字のみしか登録できない' do
          @item.price = 'aaaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('Category is not a number')
        end
       
        it 'category_idが空では登録できない' do
          @item.category_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
        it 'item_conditionが空では登録できない' do
          @item.item_condition_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition is not a number")
        end
        it 'shipping_cost_idが空では登録できない' do
          @item.shipping_cost_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost is not a number")
        end
        it 'prefectureが空では登録できない' do
          @item.prefecture_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture is not a number")
        end
        it 'shippng_day_idが空では登録できない' do
          @item.shipping_day_id = '---'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day is not a number")
        end
  
        it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
    end
  end
end
    