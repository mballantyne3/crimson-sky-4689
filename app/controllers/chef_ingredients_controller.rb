class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
    @ingredients_used = @chef.ingredients_used
  end
end
