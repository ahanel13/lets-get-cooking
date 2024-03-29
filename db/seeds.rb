# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = 'admin@test.com'
user.password = 'password'
user.password_confirmation = 'password'
user.superadmin_role = true
user.save!

Tag.create(name: "Breakfast")
Tag.create(name: "Brunch")
Tag.create(name: "Lunch")
Tag.create(name: "Dinner")
Tag.create(name: "Vegan")
Tag.create(name: "vegetarian")
Tag.create(name: "Snack")
Tag.create(name: "Healthy")
Tag.create(name: "Under 500 Calories")
Tag.create(name: "Under 1000 Calories")

Unit.create(name: "Cup(s)")
Unit.create(name: "Tablespoon(s)", abreviation: "Tbsp")
Unit.create(name: "Teaspoon(s)", abreviation: "Tsp")
Unit.create(name: "Pound(s)", abreviation: "Lbs")

Ingredient.create(name: "Carrot")
Ingredient.create(name: "Chuck Roast")
Ingredient.create(name: "Ground Beef")
Ingredient.create(name: "Celery")
Ingredient.create(name: "Potato")