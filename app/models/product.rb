class Product < ApplicationRecord
    has_many :products_categories
    has_many :categories, through: :products_categories, dependent: :destroy
    has_many_attached :images
    belongs_to :seller, class_name: "User"
    belongs_to :buyer, class_name: "User"

    # validates_with CategoryValidator
    validates :categories, presence: true
    validates :name, presence: true
    validates :price, presence: true, numericality: true
    validates :description, presence: true
    validate :image_type

    # accepts_nested_attributes_for :categories

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            category = Category.find_or_create_by(category_attribute) unless category_attribute[:name].blank?
            self.categories << category unless category.nil?
        end
    end

    def thumbnails
        images.each do |image|
            image.variant(resize: '300x300!').processed
        end
    end

    def image_type
        if !images.attached?
            errors.add(:images, "(or at least one image) must exist for product.")
        end
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
                errors.add(:images, "must be formatted as either .jpeg or .png")
            end
        end
    end

end
