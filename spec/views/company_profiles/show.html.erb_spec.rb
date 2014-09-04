require 'spec_helper'

describe "company_profiles/show" do
  before(:each) do
    @company_profile = assign(:company_profile, stub_model(CompanyProfile,
      :company_name => "Company Name",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip_code => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    rendered.should match(/Street Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/1/)
  end
end
