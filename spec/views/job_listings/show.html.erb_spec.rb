require 'spec_helper'

describe "job_listings/show" do
  before(:each) do
    @job_listing = assign(:job_listing, stub_model(JobListing))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
