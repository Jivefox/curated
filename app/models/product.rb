class Product < ApplicationRecord
    has_many :products_categories
    has_many :categories, through: :products_categories, dependent: :destroy

    # validates_with CategoryValidator
    validates :categories, presence: true, unless: :category_attributes_present?
    validates :name, presence: true
    validates :price, numericality: true
    # accepts_nested_attributes_for :categories

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            category = Category.find_or_create_by(category_attribute) unless category_attribute[:name].blank?
            self.categories << category unless category.nil?
            end 
        end
    end

    # def category_attributes_present?
    #     category_attributes.present?
    # end
end
