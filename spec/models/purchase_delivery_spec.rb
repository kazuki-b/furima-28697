require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do	
    @purchase_delivery = FactoryBot.build(:purchase_delivery)
  end
    
  describe '購入情報の保存' do
    context '購入できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_delivery.building_name = ''
        expect(@purchase_delivery).to be_valid
      end
    end
    context '購入できない場合' do
      it 'tokenが空だと購入できないこと' do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できないこと' do
        @purchase_delivery.postal_cord = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal cord can't be blank","Postal cord is invalid")
      end
      it 'postal_codeが半角のハイフンでないと購入できないこと' do
        @purchase_delivery.postal_cord = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postal cord is invalid')
      end
      it 'areaが空だと購入できないこと' do
        @purchase_delivery.area_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Area can't be blank")
      end
      it 'areaが1では購入できないこと' do
        @purchase_delivery.area_id = '1'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Area must be other than 1")
      end
      it 'cityが空だと購入できないこと' do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressは空だと購入できないこと' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberは空だと購入できないこと' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁でないと購入できないこと' do
        @purchase_delivery.phone_number = '123456789112'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
