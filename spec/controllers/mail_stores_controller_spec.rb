require 'rails_helper'

RSpec.describe MailStoresController, type: :controller do

  describe "GET #template" do
    it "returns http success" do
      get :template
      expect(response).to have_http_status(:success)
    end
  end

end
