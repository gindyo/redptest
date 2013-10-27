require "spec_helper"

describe StarboxesController do
  describe "routing" do

    it "routes to #index" do
      get("/starboxes").should route_to("starboxes#index")
    end

    it "routes to #new" do
      get("/starboxes/new").should route_to("starboxes#new")
    end

    it "routes to #show" do
      get("/starboxes/1").should route_to("starboxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/starboxes/1/edit").should route_to("starboxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/starboxes").should route_to("starboxes#create")
    end

    it "routes to #update" do
      put("/starboxes/1").should route_to("starboxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/starboxes/1").should route_to("starboxes#destroy", :id => "1")
    end

  end
end
