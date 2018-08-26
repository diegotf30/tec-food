class OrdersController < ApplicationController
  /before_action :must_be_verified/
  
  def show
    @order = Purchase.find_by(id: params[:id])
  end

  def index
    @orders = [1,2,3,4,5] 
  end
end
