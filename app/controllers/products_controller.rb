class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        if params[:category_id]
            @category = Category.find_by(id: params[:category_id])
            if @category.nil?
                redirect_to categories_path, alert: "Category not found"
            else
                @products = @category.products
            end
        else
            @products = Product.all
        end
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(products_params)
        # binding.pry
        redirect_to product_path(@product)
    end

    def show
        if params[:category_id]
            @category = Category.find_by(id: params[:category_id])
            @product = @category.products.find_by(id: params[:id])
            if @product.nil?
                redirect_to category_products_path(@category), alert: "Product not found"
            end
        else
            @product = Product.find(params[:id])
        end
        # binding.pry
    end

    def edit
    end

    def update

    end

    def destroy

    end

private

    def set_product
        @product = Product.find_by(id: params[:id])
        redirect_to products_path, alert: "Product not found" if @product.nil?
    end

    def products_params
        params.require(:product).permit(:name, :description, :price, :admin, category_ids: [], categories_attributes: [:name])
    end
end
