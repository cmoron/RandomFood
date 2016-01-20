class AddIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_id, :integer, first: true
  end
end
