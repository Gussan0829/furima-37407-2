class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :municipality, :address, :building_name, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id]
  end

end
