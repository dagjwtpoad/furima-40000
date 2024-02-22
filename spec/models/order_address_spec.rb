require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id)
  end

  describe '購入機能情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが"--"では登録できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが全角だと保存できないこと' do
        @order_address.telephone_number = '０９０５５５５６６６６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが10/11文字未満だと保存できないこと' do
        @order_address.telephone_number = 010222333
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが英数字混合だと保存できないこと' do
        @order_address.telephone_number = 'abcd1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
    end
  end
end
