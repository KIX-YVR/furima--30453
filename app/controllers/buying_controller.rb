class BuyingController < ApplicationController
  def index
    @buying = Buying.new
  end

  def new
    @buying = Buying.new
  end

  def create
    @buying = Buying.new(buying_params)
    if @buying.valid?
      @buying.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def buying_params
    params.require(:buying).permit(:user, :item, :zip_code, :prefucture, :city, :address_line, :bulding_name, :phone_number, :purchase_info)
  end
end
