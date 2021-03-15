require 'rails_helper'

RSpec.describe ManagementAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @management_address = FactoryBot.build(:management_address, user_id: user.id)
    end
    
   
   context '配送先情報が保存できない時' do
     it 'postal_codeが空だと保存できないこと' do
      @management_address.postal_code = ''
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("Postal code can't be blank")
     end
     it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @management_address.postal_code = '1234567'
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
     end
     it 'prefectureを選択していないと保存できないこと' do
      @management_address.prefecture_id = 0
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("Prefecture can't be blank")
     end
     it 'cityは空だと保存できない' do
      @management_address.city = ''
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("City can't be blank")
     end
     it 'house_numberは空だと保存できない' do
      @management_address.house_number = ''
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("House number can't be blank")
     end
     it 'phone_numberが空だと保存できないこと' do
      @management_address.phone_number = ''
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("Phone number can't be blank")
     end
      it 'phone_numberが半角数字のみしか登録できない' do
        @management_address.phone_number = 'aaaaaa'
        @management_address.valid?
        expect(@management_address.errors.full_messages).to include('Phone number 半角数字を使用してください')
     end
     it 'phone_numberが11桁以内ではないと登録できない' do
      @management_address.phone_number = 'aaaaaaaaaaaa'
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include('Phone number 半角数字を使用してください')
   end
     it "tokenが空では登録できないこと" do
      @management_address.token = nil
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("Token can't be blank")
    end
      

    end
  end
end
