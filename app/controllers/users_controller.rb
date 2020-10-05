class UsersController < ApplicationController

    def show
        binding.pry
        @user = User.find(params[:id])
        @products = Product.all
    end

end