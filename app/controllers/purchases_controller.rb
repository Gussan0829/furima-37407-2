class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
    binding.pry
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user, :item)
  end

end
