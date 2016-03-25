class TestController < ApplicationController

  before_action :authenticate_user!

  def index
    @test = Test.all

  end
end
