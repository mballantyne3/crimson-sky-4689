class EliminateDoubleHasManyFromDishesAndIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_reference :ingredients, :dish
  end
end
