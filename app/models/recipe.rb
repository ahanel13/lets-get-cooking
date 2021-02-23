class Recipe < ApplicationRecord
    has_many :steps, dependent: :destroy
    accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

    has_many :comments, dependent: :destroy
    
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
end
