class Tag < ApplicationRecord
    has_many :recipe_tags, dependent: :destroy
    has_many :recipes, through: :recipe_tags

    def self.tagged_with(name)
        Tag.find_by!(name: name).recipes
    end

    def self.tag_counts
      Tag.select('tags.*, count(recipe_tags.tag_id) as count').joins(:recipe_tags).group('recipe_tags.tag_id')
    end

    def tag_list
      tags.map(&:name).join(', ')
    end

    def tag_list=(names)
      self.tags = names.split(',').map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end
end
