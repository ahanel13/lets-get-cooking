class RecipeIngredient < ApplicationRecord
  has_one :unit
  
  belongs_to :ingredient
  belongs_to :recipe
end
