# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "vodka")
# Ingredient.create(name: "whisky")
# Ingredient.create(name: "tomato juice")

require 'open-uri'
require 'json'

Dose.delete_all
Cocktail.delete_all
Ingredient.delete_all

# url = "https://res.cloudinary.com/dev42/image/upload/v1564726389/beverager.pro/wrfir9vwkeln1xz5wokx.jpg"
# cocktail = Cocktail.new(name: 'Mojito')
# cocktail.remote_photo_url = url
# cocktail.save

# url = "https://res.cloudinary.com/dev42/image/upload/v1564726424/beverager.pro/frhmwfgpjdvopru22hkm.jpg"
# cocktail = Cocktail.new(name: 'Long Island Tea')
# cocktail.remote_photo_url = url
# cocktail.save

# url = "https://res.cloudinary.com/dev42/image/upload/v1564726445/beverager.pro/f11dfme4txezlhx9q1ng.jpg"
# cocktail = Cocktail.new(name: 'Margarita')
# cocktail.remote_photo_url = url
# cocktail.save

# url = "https://res.cloudinary.com/dev42/image/upload/v1564726550/beverager.pro/kjmjm9s6bbe3qnfs7peq.jpg"
# cocktail = Cocktail.new(name: 'Daiquiri')
# cocktail.remote_photo_url = url
# cocktail.save

# url = "https://res.cloudinary.com/dev42/image/upload/v1564726533/beverager.pro/rrgq1jbqpbpgrdnukwus.jpg"
# cocktail = Cocktail.new(name: 'Moscow Mule')
# cocktail.remote_photo_url = url
# cocktail.save

open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list") do |ingredients|
  ingredients.read.each_line do |ingredient|
    temp = JSON.parse(ingredient)
    temp["drinks"].each do |item|
      Ingredient.create!(name: item["strIngredient1"])
    end
  end
end