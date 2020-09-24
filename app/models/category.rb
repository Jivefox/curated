class Category < ApplicationRecord
    has_many :products_categories
    has_many :products, through: :products_categories, dependent: :destroy

    validates :name, presence: true
    after_validation :set_slug, only: [:create, :update]

    def set_slug
        self.slug = self.name.parameterize
    end

    def to_param
        slug
    end
end
