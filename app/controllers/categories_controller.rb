class CategoriesController < ApplicationController
    
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def show
        @category = Category.find_by(id: params[:id])
    end


end