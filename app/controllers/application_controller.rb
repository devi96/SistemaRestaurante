class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :current_user, :signed_in?, :is_admin?


  def current_user
    @current_user ||= Empleado.find(session[:current_user_id]) if session[:current_user_id]
  end

  def signed_in?
    if current_user.blank?
      return false
    else
      return true
    end
  end

  def is_admin?
    if signed_in?
      if current_user.rol == "admin"
        return true
      else
        return false
      end
    else
      return false
    end
  end

end
