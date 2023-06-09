require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できない' do
        @order.post_code = '000-000０'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号は『３桁ハイフン４桁』ハイフンがないと保存できない' do
        @order.post_code = '0000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと購入できない' do
        @order.shipping_origin_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Shipping origin must be other than 1')
      end
      it '市区町村が空だと購入できない' do
        @order.mayor_ward_village = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Mayor ward village can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できない' do
        @order.telephone_number = '000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が12桁以上だと購入できない' do
        @order.telephone_number = '0000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is too long (maximum is 11 characters)')
      end
      it '電話番号が半角数値でないと購入できない' do
        @order.telephone_number = '０００0000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'user_idが紐づいていなければ購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
