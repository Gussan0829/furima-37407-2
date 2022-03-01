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
      expect(@purchase_shipping.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping.post_code = '1234567'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('郵便番号は不正な値です')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_shipping.prefecture_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("都道府県は1以外の値にしてください")
    end
    it 'municipalityが空だと保存できないこと' do
      @purchase_shipping.municipality = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_shipping.address = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("番地を入力してください")
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping.phone_number = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'phone_numberが9桁以内の半角数値では無いと保存できないこと' do
      @purchase_shipping.phone_number = '11111'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end
    it 'phone_numberが12桁以上の半角数値では無いと保存できないこと' do
      @purchase_shipping.phone_number = '111111111111'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end
    it 'phone_numberが全角数値が含まれていれば、保存できないこと' do
      @purchase_shipping.phone_number = "111111111１"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end
    it "tokenが空では登録できないこと" do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("カード情報を入力してください")
    end
    it 'user_idが空だと保存できないこと' do
      @purchase_shipping.user_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Userを入力してください")
    end
    it 'item_idが空だと保存できないこと' do
      @purchase_shipping.item_id = ''
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Itemを入力してください")
    end
  end
end