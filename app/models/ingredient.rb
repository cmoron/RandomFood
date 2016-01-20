class Ingredient < ActiveRecord::Base
	has_many :links
	has_many :recipes, through: :links
end
