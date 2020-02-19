class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end
1
  def show
    @restaurants = Restaurant.find(params[:id])
  end

  def new
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :stars)
  end
end
