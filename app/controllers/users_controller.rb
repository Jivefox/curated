class UsersController < ApplicationController

    def show
        binding.pry
        @user = User.find(params[:id])
        if current_admin?
            @pending_approval = Product.pending_products

            redirect_to admin_user_path(@user)
        else
            @sold_products = @user.sold_products
            @bought_products = @user.bought_products

            render :show
        end
    end

end