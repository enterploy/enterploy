require "spec_helper"

describe CompanyProfilesController do
  describe "routing" do

    it "routes to #index" do
      get("/company_profiles").should route_to("company_profiles#index")
    end

    it "routes to #new" do
      get("/company_profiles/new").should route_to("company_profiles#new")
    end

    it "routes to #show" do
      get("/company_profiles/1").should route_to("company_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/company_profiles/1/edit").should route_to("company_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/company_profiles").should route_to("company_profiles#create")
    end

    it "routes to #update" do
      put("/company_profiles/1").should route_to("company_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/company_profiles/1").should route_to("company_profiles#destroy", :id => "1")
    end

  end
end
