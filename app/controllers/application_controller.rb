class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
  
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone_number, :description])
    end

    def set_search
      @search = Room.ransack(params[:q])
      @rooms = @search.result
    end
  end