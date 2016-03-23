class AppointmentsController < ApplicationController
  include DateTimeHelper

  def convert date
  somedate = DateTime.new(date["start(1i)"].to_i,
                          date["start(2i)"].to_i,
                          date["start(3i)"].to_i,
                          date["start(4i)"].to_i,
                          date["start(5i)"].to_i)
  end

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
    @appointment = Itinerary.find params[:id]
    #@appointment.update_attributes!(params[:appointment])
    #puts(@appointment)
    @appointment.update(:description => params[:appointment][:description])
    puts(@appointment)
    #@appointment.update(:start => Date.new(params[:appointment][:start]["1i"])
    @appointment.update(self.convert(params[:appointment]))

    #puts(DateTimeHelper.convert([:appointment][:start]))
    #puts(params[:appointment][:description])
    #flash[:notice] = "#{@appointment.title} was successfully updated."
    redirect_to appointment_path(@appointment)
  end

  def destroy
  end

  def show
    id = params[:id] 
    @appointment = Itinerary.find(id)
  end
end
