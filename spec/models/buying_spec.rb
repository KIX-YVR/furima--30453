require 'rails_helper'

RSpec.describe Buying, type: :model do
  describe '商品購入' do
    before do
      @buying = FactoryBot.build(:buying)
    end

    context '商品購入がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buying).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
    it 'zip_codeが空だと保存できないこと' do
      @buying.zip_code = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buying.zip_code = '0000000'
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Zip code is invalid")
    end
    it 'prefuctureを選択していないと保存できないこと' do
      @buying.prefucture_id = 1
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Prefucture can't be blank")
    end
    it 'cityは空では保存できないこと' do
      @buying.city = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("City can't be blank")
    end
    it 'address_lineは空でも保存できること' do
      @buying.address_line = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Address line can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @buying.building_name = nil
      expect(@buying).to be_valid
    end
    it 'phone_numberは空では保存できないこと' do
      @buying.phone_number = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは半角でないと保存できないこと' do
      @buying.phone_number = "１１１１１"
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが12桁以上では保存できないこと' do
      @buying.phone_number = 000000000000
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @buying.token = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Token can't be blank")
    end
  end
  end
end