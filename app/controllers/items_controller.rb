class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only:[:show,:edit, :update, :destroy]
  before_action :move_to_index, only:[:edit, :update]
  before_action :move_to_index1, only: [:edit]

  def index
    @items = Item.order('updated_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to  item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to  root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :content, :charge_id, :delivery_id, :condition_id, :prefecture_id,
                                {images: []}).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_index1
    if @item.purchase.present?
      redirect_to root_path
    end
  end

end
