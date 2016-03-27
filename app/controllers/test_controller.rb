class TestController < ApplicationController
  def index
    session[:user_id] = nil
    puts current_user.inspect
  end
end
