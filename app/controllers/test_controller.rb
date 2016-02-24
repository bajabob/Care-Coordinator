class TestController < ApplicationController
  def index
    @test = Test.all

  end
end
