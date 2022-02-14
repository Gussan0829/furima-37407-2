require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @purchase_shipping.building_name = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空だと保存できないこと' do
      @purchase_shipping.post_code = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping.post_code = '1234567'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Post code is invalid')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_shipping.prefecture_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'municipalityが空だと保存できないこと' do
      @purchase_shipping.municipality = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_shipping.address = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping.phone_number = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが9桁以内の半角数値では無いと保存できないこと' do
      @purchase_shipping.phone_number = 11111
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが11桁以上の半角数値では無いと保存できないこと' do
      @purchase_shipping.phone_number = 11111111111111111111111111
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが全角数値では無いと保存できないこと' do
      @purchase_shipping.phone_number = "１１１１１１１１１１"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できないこと" do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @purchase_shipping.user_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @purchase_shipping.item_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end
  end
end