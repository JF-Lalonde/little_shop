class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show

    # @order = Order.find(params[:id])
    @user = User.last
    @order = @user.orders.find(params[:id])

    # current_user
    # @user  = User.find(params[:user_id])
  end

end
