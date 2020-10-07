class Admin::UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @pending_products = Product.pending_products
    end

end