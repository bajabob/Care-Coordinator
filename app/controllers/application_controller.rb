class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  # check if a user is currently logged in, used as a before_filter in controllers
  def authenticate_user!
    if(!session[:user_id].present?)
      redirect_to accounts_login_url
    end
  end

  # HELPER: get the currently logged in user model obj
  # in your controller, call `current_user` to get the current logged in user object
  def current_user
    if(session[:user_id].present?)
      return User.where(:id => session[:user_id]).first
    else
      raise 'No user currently logged in, yet one is expected. Please make sure your controller is calling
              `before_action :authenticate_user!` to check that a user is logged in.'
    end
  end

end
