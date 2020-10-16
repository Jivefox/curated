class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorized_admin?
    
    def show
        @user = User.find(params[:id])
        @pending_products = Product.pending_products
    end

    private

    def authorized_admin?
      unless current_admin?
        flash[:alert] = "What are you doing?  You can't go there."
        redirect_to root_path
      end
    end

end