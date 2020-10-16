class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index]

    def index
        # binding.pry
        if params[:category_id]
            @category = Category.find_by(slug: params[:category_id])
            if @category.nil?
                redirect_to categories_path, alert: "Category not found"
            else
                @available_products = @category.available_products # this is wrong.  @category doesn't respond to the class method self.available_products
            end
        else
            @available_products = Product.available_products
            @pending_products = Product.pending_products
            @sold_products = Product.sold_products
        end
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(products_params)
        @product.seller = current_user
        # binding.pry
        if @product.valid?
            @product.save
            redirect_to product_path(@product)
        else 
            render :new        
        end
    end

    def show
        # binding.pry
        if params[:category_id]
            @category = Category.find_by(slug: params[:category_id])
            @product = @category.products.find_by(id: params[:id])
            if @product.nil?
                redirect_to category_products_path(@category), alert: "Product not found"
            end
        else
            @product = Product.find(params[:id])
        end
    end

    def edit
        if current_admin? || @product.seller == current_user
            render :edit
        else
            redirect_to products_path, alert: "You do not have permission to edit this product."
        end
    end

    def update
        # binding.pry
        @product.update(products_params)

        if params[:commit] == "Buy"
            @product.available = false
            @product.buyer = current_user
            @product.approved = true
        elsif @product.save
            if current_admin?
                redirect_to admin_user_path(current_user)
            else
                redirect_to products_path
            end
        else
            render :edit
        end
    end

    def destroy
        if current_admin? || @product.seller == current_user
            render :edit
        else
            redirect_to products_path, alert: "You do not have permission to delete this product."
        end
    end

private

    def set_product
        @product = Product.find_by(id: params[:id])
        redirect_to products_path, alert: "Product not found" if @product.nil?
    end

    def products_params
        params.require(:product).permit(
            :name, 
            :description, 
            :price, 
            :approved,
            :sold,
            :seller,
            :buyer,
            category_ids: [], 
            images: [], 
            categories_attributes: [:name])
            .with_defaults(approved: false)
    end
end
