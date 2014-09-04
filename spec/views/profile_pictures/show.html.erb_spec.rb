require 'spec_helper'

describe "profile_pictures/show" do
  before(:each) do
    @profile_picture = assign(:profile_picture, stub_model(ProfilePicture))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
