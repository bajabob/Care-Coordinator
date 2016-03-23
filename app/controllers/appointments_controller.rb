class AppointmentsController < ApplicationController
  include DateTimeHelper

  def convertStart date
  somedate = DateTime.new(date["start(1i)"].to_i,
                          date["start(2i)"].to_i,
                          date["start(3i)"].to_i,
                          date["start(4i)"].to_i,
                          date["start(5i)"].to_i)
  end

  def convertEnd date
  somedate = DateTime.new(date["end(1i)"].to_i,
                          date["end(2i)"].to_i,
                          date["end(3i)"].to_i,
                          date["end(4i)"].to_i,
                          date["end(5i)"].to_i)
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
    puts(params[:appointment])
    @appointment = Itinerary.create!(:description => params[:appointment][:description], 
                  :start => self.convertStart(params[:appointment]), 
                  :care_provider_id => params[:appointment][:care_provider_id],
                  :end => self.convertEnd(params[:appointment]),
                  :user_id => 1)

    flash[:notice] = "#{@appointment.description} was successfully created."
    redirect_to appointments_view_path
  end

  def edit
    id = params[:id] 
    @appointment = Itinerary.find(id)
    @care_providers = CareProvider.ids
  end

  def update
    @appointment = Itinerary.find params[:id]
    puts(@appointment)
    @appointment.update(:description => params[:appointment][:description])
    @appointment.update(:start => self.convertStart(params[:appointment]))
    @appointment.update(:end => self.convertEnd(params[:appointment]))
    @appointment.update(:care_provider_id => params[:appointment][:care_provider_id])
    redirect_to appointment_path(@appointment)
  end

  def destroy
  end

  def show
    id = params[:id] 
    @appointment = Itinerary.find(id)
  end
end
