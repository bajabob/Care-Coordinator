class ProvidersController < ApplicationController

    before_action :authenticate_user!

    def new

    end

    def create

    end

    def edit
        id = params[:id] 
        @provider = CareProvider.find(id)
    end

    def update

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
