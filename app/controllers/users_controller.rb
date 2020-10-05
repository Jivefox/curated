class UsersController < ApplicationController

    def show
        binding.pry
        @user = User.find(params[:id])
    end

private

    def current_user?
        current_user
    end
end
