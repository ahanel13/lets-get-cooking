class Recipe < ApplicationRecord
    has_many :steps, dependent: :destroy
    # accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

    has_many :comments, dependent: :destroy
    has_many :recipeingredients
end
