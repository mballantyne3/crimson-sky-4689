class CreateChefIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :chef_ingredients do |t|
      t.references :chef
      t.references :ingredient
      t.timestamps
    end
  end
end
