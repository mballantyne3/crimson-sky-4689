require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "instance methods" do
    it 'displays what ingredients were used by a specified chef' do
      @chef_1 = Chef.create!(name: "MacKinley")
      @mac = Dish.create!(name: "Mac n Cheese", description: "cheesy goodness", chef_id: @chef_1.id)
      @cheddar = Ingredient.create!(name: "Cheddar", calories: 250, dish_id: @mac.id)
      @pasta = Ingredient.create!(name: "Pasta", calories: 150, dish_id: @mac.id)
      ChefIngredient.create!(chef_id: @chef_1.id, ingredient_id: @pasta.id)
      ChefIngredient.create!(chef_id: @chef_1.id, ingredient_id: @cheddar.id)

      expect(@chef_1.ingredients_used).to eq("Cheddar and Pasta")
    end
  end
end
