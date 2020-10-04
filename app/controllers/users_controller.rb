class UsersController < ApplicationController

    def show
        binding.pry
        @user = current_user
    end

private

    def current_user?
        current_user
    end
end
