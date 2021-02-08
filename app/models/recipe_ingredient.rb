class RecipeIngredient < ApplicationRecord
  has_one :unit
  has_one :ingredient
  has_one :recipe
end
