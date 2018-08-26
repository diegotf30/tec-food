class RestaurantController < ApplicationController
  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def menu
    restaurant = Restaurant.find_by(id: params[:id])
    { 'menu' => restaurant.products.map { |p| { p.name => p.price } } }.to_json
  end

  def hours
    restaurant = Restaurant.find_by(id: params[:id])
    { 'opens' => restaurant.opening_hours, 'closes' => restaurant.closing_hours }.to_json
  end

  def daily_meal
    restaurant = Restaurant.find_by(id: params[:id])
    { 'daily_meal' => restaurant.daily_meal }.to_json
  end

  def waiting_time
    { 'time' => [10,15,20,25,30,45,60].sample }.to_json
  end

  def order

  end
end
