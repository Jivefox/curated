class Category < ApplicationRecord
    has_many :products_categories
    has_many :products, through: :products_categories

    validates :name, presence: true
    after_validation :set_slug, only: [:create, :update]

private

    def set_slug
        self.slug = self.name.parameterize
    end
end
