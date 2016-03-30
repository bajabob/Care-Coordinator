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

    end

    def show
        id = params[:id] 
        @provider = CareProvider.find(id)
    end
end
