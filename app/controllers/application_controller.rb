class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    include CanCan::ControllerAdditions

    rescue_from CanCan::AccessDenied do |exception| 
        redirect_to root_path, alert: "You do not have permissions to perform this action."
    end
    rescue_from ArgumentError do |exception|
        redirect_to root_path, alert: exception.message
    end
end
