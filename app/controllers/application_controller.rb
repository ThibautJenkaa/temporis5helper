class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def is_admin? 
    if current_user
      if !current_user.admin
        redirect_to root_path
      end
    else 
      redirect_to root_path
    end
  end

  def require_user
    if !logged_in?
      flash[:alert] = "Seuls les modérateurs du site ont accès à cette action"
      redirect_to login_path
    end
  end

end
