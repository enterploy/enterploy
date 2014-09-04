require 'spec_helper'

describe "employments/index" do
  before(:each) do
    assign(:employments, [
      stub_model(Employment),
      stub_model(Employment)
    ])
  end

  it "renders a list of employments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
