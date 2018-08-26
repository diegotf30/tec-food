class OrdersController < ApplicationController
  before_action :must_be_verified
  
  def show
    @order = Purchase.find_by(id: params[:id])
  end

  def index
    @orders = Purchase.where(user: current_user)
  end
end
