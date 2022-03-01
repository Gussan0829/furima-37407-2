require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品投稿' do
    context '商品投稿ができるとき' do
      it 'name、category_id、price、content、charge、delivery、condition、prefecture、imagesが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品投稿ができないとき' do
      it '商品名が空だと投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では投稿できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品画像が空では投稿できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像は1枚以上5枚以下にしてください")
      end
      it 'カテゴリーの情報が1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態の情報が1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料の負担の情報が1では登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '配送元の地域の情報が1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end
      it '配送までの日数の情報が1では登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を選択してください")
      end
      it '価格の情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格は、¥300以下では保存不可能であること' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it '価格は、¥9999999以上では保存不可能であること' do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it '価格は半角数値でないと保存不可能であること' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'ユーザーと紐づいていなければ出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
