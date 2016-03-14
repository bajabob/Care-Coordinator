require 'rails_helper'

RSpec.describe TmplsController, type: :controller do

  describe "GET #month" do
    it "returns http success" do
      get :month
      expect(response).to have_http_status(:success)
    end
  end

end
