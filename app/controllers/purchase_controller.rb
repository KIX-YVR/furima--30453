class PurchaseController < ApplicationController
  before_action :set_item, only: [:index, :new, :create]
  before_action :item_buying, only: [:index, :new]
  before_action :authenticate_user!, except: [:new, :create]

  def index
  if current_user == @item.user || @item.purchase_info.present?
    redirect_to root_path
  end

  end

  def new

  end

  def create
    @buying = Buying.new(buying_params)
    if @buying.valid?
      pay_item
      @buying.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_buying
    @buying = Buying.new
  end

  def buying_params
    params.permit(:price, :item_id, :zip_code, :prefucture_id, :city, :address_line, :building_name, :phone_number, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: buying_params[:token],    
      currency: 'jpy'                 
    )
  end

end
