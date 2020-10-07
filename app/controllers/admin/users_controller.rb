class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorized?
    
    def show
        @user = User.find(params[:id])
        @pending_products = Product.pending_products
    end

    private

    def authorized?
      unless current_admin?
        flash[:error] = "What are you doing here?  You can't be here."
        redirect_to root_path
      end
    end

end