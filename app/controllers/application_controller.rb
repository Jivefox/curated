class ApplicationController < ActionController::Base
    helper_method :current_admin?

    def current_admin?
        current_user && current_user.admin
    end

end
