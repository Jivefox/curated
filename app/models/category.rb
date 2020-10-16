class Category < ApplicationRecord
    has_many :products_categories
    has_many :products, through: :products_categories, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    after_validation :set_slug, only: [:create, :update]

    def set_slug
        self.slug = self.name.parameterize
    end

    def to_param
        slug
    end

    def available_products
        self.products.where(approved: true, sold: false)
    end
end
