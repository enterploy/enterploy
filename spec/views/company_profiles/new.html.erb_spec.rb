require 'spec_helper'

describe "company_profiles/new" do
  before(:each) do
    assign(:company_profile, stub_model(CompanyProfile,
      :company_name => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => 1
    ).as_new_record)
  end

  it "renders new company_profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_profiles_path, "post" do
      assert_select "input#company_profile_company_name[name=?]", "company_profile[company_name]"
      assert_select "input#company_profile_street_address[name=?]", "company_profile[street_address]"
      assert_select "input#company_profile_city[name=?]", "company_profile[city]"
      assert_select "input#company_profile_state[name=?]", "company_profile[state]"
      assert_select "input#company_profile_zip_code[name=?]", "company_profile[zip_code]"
    end
  end
end
