class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate_user!

    if(!session[:user_id].present?)
      redirect_to accounts_login_url
    end

  end

  private

  @current_user = nil

end
