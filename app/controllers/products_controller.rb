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
        @product = Product.new(products_params)
        # binding.pry
        if @product.valid?
            @product.save
            redirect_to product_path(@product)
        else 
            redirect_to new_product_path
        end
    end

    def show
        # binding.pry
        if params[:category_id]
            @category = Category.find_by(id: params[:category_id])
            @product = @category.products.find_by(id: params[:id])
            if @product.nil?
                redirect_to category_products_path(@category), alert: "Product not found"
            end
        else
            @product = Product.find(params[:id])
        end
    end

    def edit
    end

    def update
        @product.update(products_params)

        if @product.save
            redirect_to @product
        else
            render :edit
        end
    end

    def destroy

    end

private

    def set_product
        @product = Product.find_by(id: params[:id])
        redirect_to products_path, alert: "Product not found" if @product.nil?
    end

    def products_params
        params
            .require(:product)
            .permit(:name, :description, :price, :approved, category_ids: [], categories_attributes: [:name])
            .with_defaults(approved: false)
    end
end
