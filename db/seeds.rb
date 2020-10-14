# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Product.destroy_all

categories = [{name: "Furniture"},
    {name: "Men's Clothing"},
    {name: "Electronics"},
    {name: "Office"},
    {name: "Misc"}]
    
        categories.each do |category|
            Category.create(category)
        end


products = [{name: "Black Tolix H Stool 75", description: "An overpriced stool that could be yours for a pittance!", price: 226, approved: true, seller_id: 1}]

        products.each do |product|
            Product.create(product)
        end