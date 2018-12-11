require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe "GET #create" do
    it "returns http success" do
      post :create, { a: 1}

      expect(Pairing.count).to change
      expect(response).to have_http_status(:success)
      
    end
  end

end
