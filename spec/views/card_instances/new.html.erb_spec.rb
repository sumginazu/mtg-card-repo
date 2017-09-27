require 'rails_helper'

RSpec.describe "card_instances/new", type: :view do
  before(:each) do
    assign(:card_instance, CardInstance.new())
  end

  it "renders new card_instance form" do
    render

    assert_select "form[action=?][method=?]", card_instances_path, "post" do
    end
  end
end
