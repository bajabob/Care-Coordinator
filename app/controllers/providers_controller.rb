class ProvidersController < ApplicationController

    before_action :authenticate_user!

    def new

    end

    def create
        @care_provider = CareProvider.create!(
                  :office_name => params[:provider][:office_name], 
                  :office_phone => params[:provider][:office_phone], 
                  :office_phone_ext => params[:provider][:office_phone_ext],
                  :office_email => params[:provider][:office_email],
                  :address_line_one => params[:provider][:address_line_one],
                  :address_line_two => params[:provider][:address_line_two],
                  :city => params[:provider][:city],
                  :state => params[:provider][:state],
                  :zip => params[:provider][:zip],
                  :physician_name => params[:provider][:physician_name])

        flash[:info] = "#{@care_provider.office_name} was successfully created."
        redirect_to appointments_view_path
    end

    def edit
        id = params[:id] 
        @provider = CareProvider.find(id)
    end

    def update
        @care_provider = CareProvider.find params[:id]
        #turn the care provider office name into care provider id to update the appointment
        
        @care_provider.update(:office_name => params[:provider][:office_name])
        @care_provider.update(:office_phone => params[:provider][:office_phone])
        @care_provider.update(:office_phone_ext => params[:provider][:office_phone_ext])
        @care_provider.update(:office_email => params[:provider][:office_email])
        @care_provider.update(:address_line_one => params[:provider][:address_line_one])
        @care_provider.update(:address_line_two => params[:provider][:address_line_two])
        @care_provider.update(:city => params[:provider][:city])
        @care_provider.update(:state => params[:provider][:state])
        @care_provider.update(:zip => params[:provider][:zip])
        @care_provider.update(:physician_name => params[:provider][:physician_name])
        flash[:info] = "#{@care_provider.office_name} was successfully updated."
        redirect_to appointments_view_path
    end


    def destroy
        id = params[:id] 
        @provider = CareProvider.find(id)
        CareProvider.find(id).destroy
        flash[:info] = "#{@provider.physician_name} was successfully deleted."
        redirect_to appointments_view_path
    end

    def show
        id = params[:id] 
        @provider = CareProvider.find(id)
    end
end
