require 'rails_helper'

RSpec.describe "card_instances/index", type: :view do
  before(:each) do
    assign(:card_instances, [
      CardInstance.create!(),
      CardInstance.create!()
    ])
  end

  it "renders a list of card_instances" do
    render
  end
end
