class PurchasesController < ApplicationController
  before_action :move_to_index, only:[:index]

  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_shipping.valid?
      @purchase_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :municipality, :address, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
