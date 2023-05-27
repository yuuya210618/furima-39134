require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品情報が保存できる場合' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品画像がないと登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録されない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明がないと登録されない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品カテゴリーがないと登録されない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品状態がないと登録されない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end
      it '配送料負担情報がないと登録されない' do
        @item.shipping_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank", 'Shipping charge is not a number')
      end
      it '発送元地域情報がないと登録されない' do
        @item.shipping_origin = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank", 'Shipping origin is not a number')
      end
      it '発送日数情報がないと登録されない' do
        @item.derivary = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Derivary can't be blank", 'Derivary is not a number')
      end
      it '価格情報がないと登録されない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price is invalid')
      end
      it '価格は半角数値でないと登録されない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格300円以下は登録されない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格9999999円以上は登録されない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'ユーザーが紐付いていないと商品は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
