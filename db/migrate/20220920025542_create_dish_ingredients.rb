class CreateDishIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_ingredients do |t|
      t.bigint "dish_id"
      t.bigint "ingredient_id"
      t.timestamps
      t.references :dish
      t.references :ingredient
    end
  end
end
