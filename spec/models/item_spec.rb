require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の入力' do
    context '情報の保存ができる場合' do
      it '全ての入力が完了している' do
        expect(@item).to be_valid
      end
    end

    context '情報の保存ができない場合' do
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが"--"では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'item_status_idが"--"では登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end
      it 'shopping_cost_idが"--"では登録できない' do
        @item.shopping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost must be other than 1")
      end
      it 'shopping_date_idが"--"では登録できない' do
        @item.shopping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping date must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角文字では登録できない' do
        @item.price = 'ＡＢＣ１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英数字では登録できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語では登録できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10_000_000円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
