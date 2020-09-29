module ProductsHelper
    def sold_products
        @products.map do |product|
            product if !product.available 
        end
    end

    def pending_approval
        @products.map do |product|
            product if !product.approved
        end
    end
end
