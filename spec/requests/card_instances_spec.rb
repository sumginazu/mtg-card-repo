require 'rails_helper'

RSpec.describe "CardInstances", type: :request do
  describe "GET /card_instances" do
    it "works! (now write some real specs)" do
      get card_instances_path
      expect(response).to have_http_status(200)
    end
  end
end
