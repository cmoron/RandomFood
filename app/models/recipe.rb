class Recipe < ActiveRecord::Base
  has_many :links
  has_many :ingredients, through: :links

  # Get all recipes that contains every ingredient of the ingredients list
  def self.get_recipes_from_ingredients ingredients

    results = Array.new
    unless ingredients.empty?
      ingredients.each do |ing|
        recipes = Recipe.joins(:ingredients).where(:ingredients => {:id => ing.id})
        if results.empty?
          results = recipes
        else
          results &= recipes
        end
      end
    end
    return results

  end

end
