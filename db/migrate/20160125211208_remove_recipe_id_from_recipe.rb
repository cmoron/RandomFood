class RemoveRecipeIdFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :recipe_id, :integer
  end
end
