require "spec_helper"

describe JobListingsController do
  describe "routing" do

    it "routes to #index" do
      get("/job_listings").should route_to("job_listings#index")
    end

    it "routes to #new" do
      get("/job_listings/new").should route_to("job_listings#new")
    end

    it "routes to #show" do
      get("/job_listings/1").should route_to("job_listings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/job_listings/1/edit").should route_to("job_listings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/job_listings").should route_to("job_listings#create")
    end

    it "routes to #update" do
      put("/job_listings/1").should route_to("job_listings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/job_listings/1").should route_to("job_listings#destroy", :id => "1")
    end

  end
end
