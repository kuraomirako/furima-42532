class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_edit_delete, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @categories = Category.all
    @conditions = Condition.all
    @shipping_fees = ShippingFee.all
    @prefectures = Prefecture.all
    @delivery_times = DeliveryTime.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @categories = Category.all
      @conditions = Condition.all
      @shipping_fees = ShippingFee.all
      @prefectures = Prefecture.all
      @delivery_times = DeliveryTime.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :price, :delivery_time_id, :image).merge(user_id: current_user.id)
  end

def set_item
  @item = Item.find(params[:id])
end

def move_to_edit_delete
  unless current_user.id == @item.user_id
    redirect_to root_path
  end
end
  
end
