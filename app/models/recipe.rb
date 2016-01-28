class Recipe < ActiveRecord::Base
  has_many :links
  has_many :ingredients, through: :links
end
