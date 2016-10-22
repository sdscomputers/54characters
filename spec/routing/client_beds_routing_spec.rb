require "rails_helper"

RSpec.describe ClientBedsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/client_beds").to route_to("client_beds#index")
    end

    it "routes to #new" do
      expect(:get => "/client_beds/new").to route_to("client_beds#new")
    end

    it "routes to #show" do
      expect(:get => "/client_beds/1").to route_to("client_beds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/client_beds/1/edit").to route_to("client_beds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/client_beds").to route_to("client_beds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/client_beds/1").to route_to("client_beds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/client_beds/1").to route_to("client_beds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/client_beds/1").to route_to("client_beds#destroy", :id => "1")
    end

  end
end
