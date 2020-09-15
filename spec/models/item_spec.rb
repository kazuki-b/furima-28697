require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいく時' do
      it '全てが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '価格は半角数字で出品できる' do
        @item.price = '9999'
        expect(@item).to be_valid
      end
      it '価格は300~9,999,999の範囲で出品できる' do
        @item.price = '999,99'
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it '商品カテゴリが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品状態が空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it '配送料が空では出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank", 'Postage is not a number')
      end
      it '発送元が空では出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end
      it '発送日が空では出品できない' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank", 'Ship date is not a number')
      end
      it '商品カテゴリが---では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態が空では---できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料が---では出品できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it '発送元が---では出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it '発送日が---では出品できない' do
        @item.ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date must be other than 1')
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が9,999,999以上では出品できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
