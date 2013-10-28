require "spec_helper"

describe RecipeIngredientsController do
  describe "routing" do

    it "routes to #index" do
      get("/recipe_ingredients").should route_to("recipe_ingredients#index")
    end

    it "routes to #new" do
      get("/recipe_ingredients/new").should route_to("recipe_ingredients#new")
    end

    it "routes to #show" do
      get("/recipe_ingredients/1").should route_to("recipe_ingredients#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recipe_ingredients/1/edit").should route_to("recipe_ingredients#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recipe_ingredients").should route_to("recipe_ingredients#create")
    end

    it "routes to #update" do
      put("/recipe_ingredients/1").should route_to("recipe_ingredients#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recipe_ingredients/1").should route_to("recipe_ingredients#destroy", :id => "1")
    end

  end
end
