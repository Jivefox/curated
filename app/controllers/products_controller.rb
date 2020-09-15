class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(products_params)
        binding.pry
        redirect_to product_path(@product)
    end

    def show
    end

    def edit
    end

    def update

    end

    def destroy

    end

private

    def set_product
        @product = Product.find(params[:id])
    end

    def products_params
        params.require(:product).permit(:name, :description, :price, :admin, category_ids: [], categories_attributes: [:name])
    end
end
