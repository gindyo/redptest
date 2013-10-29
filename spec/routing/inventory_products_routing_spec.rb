require "spec_helper"

describe InventoryProductsController do
  describe "routing" do

    it "routes to #index" do
      get("/inventory_products").should route_to("inventory_products#index")
    end

    it "routes to #new" do
      get("/inventory_products/new").should route_to("inventory_products#new")
    end

    it "routes to #show" do
      get("/inventory_products/1").should route_to("inventory_products#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inventory_products/1/edit").should route_to("inventory_products#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inventory_products").should route_to("inventory_products#create")
    end

    it "routes to #update" do
      put("/inventory_products/1").should route_to("inventory_products#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inventory_products/1").should route_to("inventory_products#destroy", :id => "1")
    end

  end
end
