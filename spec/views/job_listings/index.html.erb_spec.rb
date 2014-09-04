require 'spec_helper'

describe "job_listings/index" do
  before(:each) do
    assign(:job_listings, [
      stub_model(JobListing),
      stub_model(JobListing)
    ])
  end

  it "renders a list of job_listings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
