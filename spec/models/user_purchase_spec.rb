require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_purchase = FactoryBot.build(:user_purchase, user_id: user.id, item_id: item.id)
      sleep(3)
    end
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
      end

      it 'postal_codeが空だと保存できないこと' do
        @user_purchase.postal_code = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_purchase.postal_code = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @user_purchase.prefecture_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @user_purchase.city = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      
      it 'addressが空だと保存できないこと' do
        @user_purchase.address = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephoneが空だと保存できないこと' do
        @user_purchase.telephone = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneが半角のハイフンを含んだ形式だと保存できないこと' do
        @user_purchase.telephone = '080-211-1234'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Telephone is invalid")
      end

      it 'buildingは空でも保存できること' do
        @user_purchase.building = ""
        expect(@user_purchase).to be_valid
      end
  end
end
