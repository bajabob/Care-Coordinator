class AppointmentsController < ApplicationController

  def view

    @cal_data = Array.new

    Itinerary.get_all_by_user_id(1).each { |i|
      @cal_data.push i.to_bootstrap_calendar_hash
    }

    p @cal_data.inspect
  end

  def new
    @care_providers = CareProvider.ids
  end

  def create
  end

  def edit
    id = params[:id] 
    @appointment = Itinerary.find(id)
    @care_providers = CareProvider.ids
  end

  def update
  end

  def destroy
  end

  def show
    id = params[:id] 
    @appointment = Itinerary.find(id)
  end
end
