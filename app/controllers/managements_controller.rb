class ManagementsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]
  

  
  def index
    @item = Item.find(params[:item_id])
    @management_address = ManagementAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
      if  @item.management.present?
        redirect_to root_path
     end
  end

   def create
      @item = Item.find(params[:item_id])
    @management_address = ManagementAddress.new(management_params)
    if @management_address.valid?
      pay_item
      @management_address.save
       return redirect_to root_path
       else
       render 'index'
    end
  end

  private

  def management_params
    params.require(:management_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :price, :phone_number).merge(user_id:current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_a31563ac3f47e0d02ff5405b"
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: management_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


  
end
