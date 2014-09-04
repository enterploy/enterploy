require 'spec_helper'

describe "company_profiles/index" do
  before(:each) do
    assign(:company_profiles, [
      stub_model(CompanyProfile,
        :company_name => "Company Name",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip_code => 1
      ),
      stub_model(CompanyProfile,
        :company_name => "Company Name",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip_code => 1
      )
    ])
  end

  it "renders a list of company_profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
