class AppointmentsController < ApplicationController
  def daily
    @appointments = Test.all
  end
  def weekly
    @appointments = Test.all
  end
  def monthly
    @appointments = Test.all
  end

end
