require 'rails_helper'

RSpec.describe "ClientBeds", type: :request do
  describe "GET /client_beds" do
    it "works! (now write some real specs)" do
      get client_beds_path
      expect(response).to have_http_status(200)
    end
  end
end
