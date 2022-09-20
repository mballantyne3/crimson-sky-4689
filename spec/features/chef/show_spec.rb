require 'rails_helper'

RSpec.describe 'chef show page' do
  describe 'US3' do
    before :each do
      @chef_1 = Chef.create!(name: "MacKinley")
      @mac = Dish.create!(name: "Mac n Cheese", description: "cheesy goodness", chef_id: @chef_1.id)
      @cheddar = Ingredient.create!(name: "Cheddar", calories: 250)
      @pasta = Ingredient.create!(name: "Pasta", calories: 150)
      ChefIngredient.create!(chef_id: @chef_1.id, ingredient_id: @pasta.id)
      ChefIngredient.create!(chef_id: @chef_1.id, ingredient_id: @cheddar.id)
      DishIngredient.create!(dish_id: @mac.id, ingredient_id: @pasta.id)
      DishIngredient.create!(dish_id: @mac.id, ingredient_id: @cheddar.id)
    end

    it 'displays the name of the chef' do
      visit "/chef/#{@chef_1.id}"

      expect(page).to have_content("MacKinley")
    end

    it 'has a link to view a list of all ingredients this chef uses in their dishes' do
      visit "/chef/#{@chef_1.id}"
      click_link('Chef Ingredients')

      expect(current_path).to eq("/chef/#{@chef_1.id}/ingredients")
      expect(page).to have_content("Ingredients Used: Cheddar and Pasta")
    end
  end
end
