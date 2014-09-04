require 'spec_helper'

describe "job_listings/edit" do
  before(:each) do
    @job_listing = assign(:job_listing, stub_model(JobListing))
  end

  it "renders the edit job_listing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", job_listing_path(@job_listing), "post" do
    end
  end
end
