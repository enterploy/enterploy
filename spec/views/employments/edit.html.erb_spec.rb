require 'spec_helper'

describe "employments/edit" do
  before(:each) do
    @employment = assign(:employment, stub_model(Employment))
  end

  it "renders the edit employment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employment_path(@employment), "post" do
    end
  end
end
