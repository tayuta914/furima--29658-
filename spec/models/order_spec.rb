require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactoryBot.build(:order)
    end

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end

      it "itemが空では登録できないこと" do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end

      it "userが空では登録できないこと" do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end
   end
end