class TestController < ApplicationController
  def index
    puts Time.now.inspect
  end
end
