require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name, explanation, category, condition, from_where_to_send, how_long_does_it_take_to_send, who_pays_delivery_fee, price, user, imageが存在すればできる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'categoryが空だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'conditionが空だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'from_where_to_sendが空だと出品できない' do
        @item.from_where_to_send_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("From where to send must be other than 1")
      end
      it 'how_long_does_it_take_to_sendが空だと出品できない' do
        @item.how_long_does_it_take_to_send_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("How long does it take to send must be other than 1")
      end
      it 'who_pays_delivery_feeが空では出品できない' do
        @item.who_pays_delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Who pays delivery fee must be other than 1")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが300以上でないといけない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 範囲外の数字です")        
      end
      it 'priceが9999999以下でないといけない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 範囲外の数字です")        
      end
      it 'priceが半角でないといけない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 範囲外の数字です")        
      end
    end
  end
end