class PurchasesController < ApplicationController
  before_action :item_find, only:[:index,:create]
  before_action :move_to_index, only:[:index]

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :municipality, :address, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: purchase_params[:token],   
        currency: 'jpy'                 
      )
  end

  def item_find
    @item = Item.find(params[:id])
  end

end
