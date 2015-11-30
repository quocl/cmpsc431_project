class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def current_order
      if !session[:order_id].nil?
        Order.find(session[:order_id])
      else
        Order.new
      end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :first_name, :last_name, :password, :password_confirmation, :remember_me) }
       devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :first_name, :last_name, :email, :password, :remember_me) }
       devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
    end 

end
