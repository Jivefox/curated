class ApplicationController < ActionController::Base
    helper_method :current_admin?

    def current_admin?
        current_user && current_user.admin
    end

    def after_sign_in_path_for(resource)
        if current_admin?
            admin_user_path(current_user)
        else
            root_path
        end
    end
end
