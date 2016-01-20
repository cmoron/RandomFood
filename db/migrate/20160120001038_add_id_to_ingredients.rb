class AddIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ingredient_id, :integer, first: true
  end
end
