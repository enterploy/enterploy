require 'spec_helper'

describe "job_listings/new" do
  before(:each) do
    assign(:job_listing, stub_model(JobListing).as_new_record)
  end

  it "renders new job_listing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", job_listings_path, "post" do
    end
  end
end
