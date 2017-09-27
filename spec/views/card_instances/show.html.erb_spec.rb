require 'rails_helper'

RSpec.describe "card_instances/show", type: :view do
  before(:each) do
    @card_instance = assign(:card_instance, CardInstance.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
