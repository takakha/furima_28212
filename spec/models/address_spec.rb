require 'rails_helper'

RSpec.describe Address, type: :model do

  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品の購入' do
    context '購入がうまくいくとき' do
      it '必須項目が存在すれば登録できる' do
        expect(@address).to be_valid
      end
    end
  end

  context '購入がうまくいかないとき' do
    it '郵便番号が空では登録できないこと' do
      @address.postcode = ''
      @address.valid?   
      expect(@address.errors.full_messages).to include("Postcode can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @address.postcode = '1234567'
      @address.valid?
      expect(@address.errors.full_messages).to include("Postcode is invalid")
    end

    it 'prefecture_idが1では登録できないこと' do
      @address.prefecture_id = '1'
      @address.valid?   
      expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
    end
 
    it '市町村が空では登録できないこと' do
      @address.city = ''
      @address.valid?   
      expect(@address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では登録できないこと' do
      @address.block = ''
      @address.valid?   
      expect(@address.errors.full_messages).to include("Block can't be blank")
    end

    it '建物は空でも保存できること' do
      @address.building = nil
      expect(@address).to be_valid
    end

    it '電話番号が空では登録できないこと' do
      @address.phone_number = ''
      @address.valid? 
      expect(@address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end

    it '電話番号がでは12桁以上では登録できないこと' do
      @address.phone_number = '123456789012'
      @address.valid? 
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @address.phone_number = '123-4567-8901'
      @address.valid? 
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

