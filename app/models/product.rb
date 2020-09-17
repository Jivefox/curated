class Product < ApplicationRecord
    has_many :products_categories
    has_many :categories, through: :products_categories, dependent: :destroy
    # accepts_nested_attributes_for :categories

    def categories_attributes=(category_attributes)
        binding.pry
        category_attributes.values.each do |category_attribute|
          category = Category.find_or_create_by(category_attribute)
          self.categories << category unless category.name.empty? || category.name.nil?
        end
    end
end
