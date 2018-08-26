class RestaurantController < ApplicationController
  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def menu
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    menu = { 'messages' => restaurant.products.map { |p| { 'text' => "#{p.name}: $#{p.price}" } } }.to_json

    render(
      json: menu,
      status: 200
    )
  end

  def hours
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    hours = { 'messages' => [ { 'text' => "#{restaurant.name} está abierto de #{restaurant.opening_hour} a #{restaurant.closing_hour}" } ] }.to_json

    render(
      json: hours,
      status: 200
    )
  end

  def daily_meal
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    meal = { 'messages' => [ { 'text' => "La comida del día es #{restaurant.daily_meal}" } ] }.to_json

    render(
      json: meal,
      status: 200
    )
  end

  def waiting_time
    time = { 'messages' => [ { 'text' => "El tiempo promedio de espera es #{[10,15,20,25,30,45,60].sample}" } ] }.to_json

    render(
      json: time,
      status: 200
    )
  end

  def order

  end
end
