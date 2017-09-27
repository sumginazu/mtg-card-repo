require "rails_helper"

RSpec.describe CardInstancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/card_instances").to route_to("card_instances#index")
    end

    it "routes to #new" do
      expect(:get => "/card_instances/new").to route_to("card_instances#new")
    end

    it "routes to #show" do
      expect(:get => "/card_instances/1").to route_to("card_instances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/card_instances/1/edit").to route_to("card_instances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/card_instances").to route_to("card_instances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/card_instances/1").to route_to("card_instances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/card_instances/1").to route_to("card_instances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/card_instances/1").to route_to("card_instances#destroy", :id => "1")
    end

  end
end
