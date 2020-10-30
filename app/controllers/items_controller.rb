class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :from_where_to_send_id, :how_long_does_it_take_to_send_id, :who_pays_delivery_fee_id, :user, :image, :price).merge(user_id: current_user.id)
  end
end
