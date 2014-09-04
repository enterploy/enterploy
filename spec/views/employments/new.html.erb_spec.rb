require 'spec_helper'

describe "employments/new" do
  before(:each) do
    assign(:employment, stub_model(Employment).as_new_record)
  end

  it "renders new employment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employments_path, "post" do
    end
  end
end
