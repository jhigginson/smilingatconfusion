class ApplicationController < ActionController::Base
  include TheRoleController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied
    return sender(text: 'access_denied: requires a role')
  end

  def require_signin!
    if !current_user
      flash[:alert] = "You must sign in first."
      redirect_to :root
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  alias_method :login_required, :require_signin!
  alias_method :role_access_denied, :access_denied
end
