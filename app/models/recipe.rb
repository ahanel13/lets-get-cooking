class Recipe < ApplicationRecord
    has_many :steps, dependent: :destroy
    accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

    belongs_to :tags

    has_many :comments, dependent: :destroy
end
