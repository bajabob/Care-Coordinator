class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :convert

  def convert() date
  somedate = DateTime.new(date["start(1i)"],
                          date["start(2i)"],
                          date["start(3i)"],
                          date["start(4i)"],
                          date["start(5i)"])
  end
end
