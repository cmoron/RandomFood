class RemoveIngredientIdFromIngredient < ActiveRecord::Migration
  def change
    remove_column :ingredients, :ingredient_id, :integer
  end
end
