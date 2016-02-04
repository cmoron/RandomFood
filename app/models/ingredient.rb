class Ingredient < ActiveRecord::Base
  has_many :links
  has_many :recipes, through: :links

  # The search separator string that separate the ingredients in the search string
  SEARCH_SEPARATOR = ','
  # The where clause on name field
  INGREDIENT_NAME_WHERE_CLAUSE = 'lower(name) = ?'

  # Gets ingredients array from an ingredients search string
  def self.get_ingredients_from_search_string search_string

    results = Array.new
    unless search_string.nil?
      ing_strings = search_string.split(SEARCH_SEPARATOR)

      ing_strings.each do |ing_string|
        ingredient = Ingredient.where(INGREDIENT_NAME_WHERE_CLAUSE, ing_string.downcase.strip).first
        unless ingredient.nil?
          results << ingredient
        end
      end
    end

    return results
  end

end
