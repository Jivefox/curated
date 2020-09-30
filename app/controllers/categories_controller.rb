class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        # binding.pry
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

    def set_category
        @category = Category.find_by(id: params[:id])
    end
end