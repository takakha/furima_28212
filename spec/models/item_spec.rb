require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/apple-touch-icon.png')
    end

    describe '出品登録' do
      context '登録がうまくいくとき' do
        it '必須項目が存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end
    end

    context '出品登録がうまくいかないとき' do
      it 'item(商品名)が空では登録できないこと' do
        @item.item = ''
        
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'image(画像)が空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'text(商品説明)が空では登録できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      
      it 'category_idが空では登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      
      it 'status_idが空では登録できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it 'delivery_fee_idが空では登録できないこと' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end

      it 'day_idが空では登録できないこと' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
      end


      it 'price(価格)が空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")    
      end
        
      it 'price(価格)の範囲外では登録できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")    
      end
    end
    end

