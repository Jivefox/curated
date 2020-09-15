class Product < ApplicationRecord
    has_many :products_categories
    has_many :categories, through: :products_categories
end
