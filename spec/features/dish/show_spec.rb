require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'US1' do
    before :each do
      @chef_1 = Chef.create!(name: "MacKinley")
      @mac = Dish.create!(name: "Mac n Cheese", description: "cheesy goodness", chef_id: @chef_1.id)
      @cheddar = Ingredient.create!(name: "Cheddar", calories: 250, dish_id: @mac.id)
      @pasta = Ingredient.create!(name: "Pasta", calories: 150, dish_id: @mac.id)
      DishIngredient.create!(dish_id: @mac.id, ingredient_id: @pasta.id)
      DishIngredient.create!(dish_id: @mac.id, ingredient_id: @cheddar.id)
    end

    it 'displays a dish show page with name and description' do
      visit "/dishes/#{@mac.id}"

      expect(page).to have_content(@mac.name)
      expect(page).to have_content("Description: #{@mac.description}")

      within("#ingredients") do
        expect(page).to have_content("Ingredients Used:\n#{@cheddar.name} #{@pasta.name}")
      end
    end

    it 'displays the chefs name for that dish' do
      visit "/dishes/#{@mac.id}"

      expect(page).to have_content("Compliments to the chef: #{@chef_1.name}")
    end
  end
end
