require 'rails_helper'

RSpec.describe "card_instances/edit", type: :view do
  before(:each) do
    @card_instance = assign(:card_instance, CardInstance.create!())
  end

  it "renders the edit card_instance form" do
    render

    assert_select "form[action=?][method=?]", card_instance_path(@card_instance), "post" do
    end
  end
end
