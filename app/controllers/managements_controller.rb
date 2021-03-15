class ManagementsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]
  before_action :set_item, only: [:index, :create]
  before_action :set_redirect, only: [:index, :create]

  def index
    @management_address = ManagementAddress.new
    
    end
  end

  def create
    @management_address = ManagementAddress.new(management_params)
    if @management_address.valid?
      pay_item
      @management_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def management_params
    params.require(:management_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :price, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: management_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_redirect
    if current_user == @item.user || @item.management.present?
      redirect_to root_path
  end

end
