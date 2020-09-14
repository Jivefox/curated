class ProductsController < ApplicationController
    before_action :set_productm, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
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
        params.require(:product).permit(:name, :description, :price, :admin)
    end
end
