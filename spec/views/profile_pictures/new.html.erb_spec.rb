require 'spec_helper'

describe "profile_pictures/new" do
  before(:each) do
    assign(:profile_picture, stub_model(ProfilePicture).as_new_record)
  end

  it "renders new profile_picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_pictures_path, "post" do
    end
  end
end
