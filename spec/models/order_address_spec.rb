require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @buyer = FactoryBot.build(:order_address)
    @seller = FactoryBot.build(:order_address)
  end

  describe '商品の購入' do
    context '購入がうまくいくとき' do
      it '必須項目が存在すれば登録できる' do
        expect(@buyer).to be_valid
      end
    end
  end

  context '購入がうまくいかないとき' do
    it '郵便番号が空では登録できないこと' do
      @buyer.postcode = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include('Postcode is invalid')
    end

    it '郵便番号にはハイフンが必要であること' do
      @buyer.postcode = '1234567'
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include('Postcode is invalid')
    end

    it 'prefecture_idが1では登録できないこと' do
      @buyer.prefecture_id = '1'
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'prefecture_idが空では登録できないこと' do
      @buyer.prefecture_id = nil
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市町村が空では登録できないこと' do
      @buyer.city = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では登録できないこと' do
      @buyer.block = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Block can't be blank")
    end

    it '建物は空でも保存できること' do
      @buyer.building = nil
      expect(@buyer).to be_valid
    end

    it '電話番号が空では登録できないこと' do
      @buyer.phone_number = ''
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号がでは12桁以上では登録できないこと' do
      @buyer.phone_number = '123456789012'
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @buyer.phone_number = '123-4567-8901'
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
