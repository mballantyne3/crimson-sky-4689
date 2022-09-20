class DishController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    @dishes_calories = @dish.calorie_count
  end
end
