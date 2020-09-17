# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = [{name: "Furniture"},
    {name: "Men's Clothing"},
    {name: "Electronics"},
    {name: "Office"},
    {name: "Misc"}]
    
        categories.each do |category|
            Category.create(category)
        end

products = [{name: "Tolix Stool", description: 'An overpriced stool', price: 126, approved: true, category_ids: [1]},
 {name: "Leather Jacket", description: 'An expensive jacket; v rare.', price: 1026, approved: true, category_ids: [3]},
 {name: "Used X-Box", description: 'An old console you would not be interested in.', price: 51, approved: false, category_ids: [2]},
 {name: "Horizon Needle Point Pen", description: 'A great, fine-tipped pen', price: 16, approved: true, category_ids: [4]},
 {name: "Chesterfield Sofa", description: 'A couch that belongs in a library or, like, a salon where brandy is imbibed and cigars slowly burn while people suffer outside.', price: 5099, approved: true, category_ids: [1]},
 {name: "Madewell Denim", description: 'Slim fit, colored denim', price: 106, approved: true, category_ids: [3]}
 {name: "A Fancy Trash Bin", description: 'Anything can be made artisinal', price: 33, approved: true, category_ids: [4, 5] }
]
    
    products.each do |product|
        Product.create(product)
    end

