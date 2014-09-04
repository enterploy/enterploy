require 'spec_helper'

describe "profile_pictures/index" do
  before(:each) do
    assign(:profile_pictures, [
      stub_model(ProfilePicture),
      stub_model(ProfilePicture)
    ])
  end

  it "renders a list of profile_pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
