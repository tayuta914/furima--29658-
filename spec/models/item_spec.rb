require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
  
        it "imageが空では保存できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "nameが空では保存できないこと" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        
        it "textが空では保存できないこと" do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        
        it "categoryが空では保存できないこと" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it "conditionが空では保存できないこと" do
          @item.condition_id  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it "shipping_chargeが空では保存できないこと" do
          @item.shipping_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end

        it "prefectureが空では保存できないこと" do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it "day_shipが空では保存できないこと" do
          @item.day_ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Day ship can't be blank")
        end

        it "priceが空では保存できないこと" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが300円未満だと保存できないこと" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "priceが99,9999円を超過すると保存できないこと" do
          @item.price = 1,000,000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが全角数字だと保存できないこと" do
          @item.price = "３００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

      it "category1が選択されたら出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "condition1が選択されたら出品できないこと" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "shipping_charge1が選択されたら出品できないこと" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      it "prefecture1が選択されたら出品できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "day_ship1が選択されたら出品できないこと" do
        @item.day_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day ship must be other than 1")
      end
    end
end