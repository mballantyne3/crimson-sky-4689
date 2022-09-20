require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end
  describe "instance methods" do
    it 'calculates the total calorie count of a specified dish' do
      @chef_1 = Chef.create!(name: "MacKinley")
      @mac = Dish.create!(name: "Mac n Cheese", description: "cheesy goodness", chef_id: @chef_1.id)
      @cheddar = Ingredient.create!(name: "Cheddar", calories: 250)
      @pasta = Ingredient.create!(name: "Pasta", calories: 150)
      @butter = Ingredient.create!(name: "Butter", calories: 200)
      ChefIngredient.create!(chef_id: @chef_1.id, ingredient_id: @pasta.id)
      ChefIngredient.create!(chef_id: @chef_1.id, ingredient_id: @cheddar.id)
      DishIngredient.create!(dish_id: @mac.id, ingredient_id: @pasta.id)
      DishIngredient.create!(dish_id: @mac.id, ingredient_id: @cheddar.id)
      DishIngredient.create!(dish_id: @mac.id, ingredient_id: @butter.id)

      expect(@mac.calorie_count).to eq(600)
    end
  end
end
