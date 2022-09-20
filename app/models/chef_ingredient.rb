class ChefIngredient < ApplicationRecord
  belongs_to :chef
  belongs_to :ingredient
end
