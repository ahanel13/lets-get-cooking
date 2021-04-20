class ApplicationController < ActionController::Base
    # load_and_authorize_resource
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to '/', alert: exception.message
    end

    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
