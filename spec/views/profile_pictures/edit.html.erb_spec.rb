require 'spec_helper'

describe "profile_pictures/edit" do
  before(:each) do
    @profile_picture = assign(:profile_picture, stub_model(ProfilePicture))
  end

  it "renders the edit profile_picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_picture_path(@profile_picture), "post" do
    end
  end
end
