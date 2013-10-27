require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe StarboxesController do

  # This should return the minimal set of attributes required to create a valid
  # Starbox. As you add validations to Starbox, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StarboxesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all starboxes as @starboxes" do
      starbox = Starbox.create! valid_attributes
      get :index, {}, valid_session
      assigns(:starboxes).should eq([starbox])
    end
  end

  describe "GET show" do
    it "assigns the requested starbox as @starbox" do
      starbox = Starbox.create! valid_attributes
      get :show, {:id => starbox.to_param}, valid_session
      assigns(:starbox).should eq(starbox)
    end
  end

  describe "GET new" do
    it "assigns a new starbox as @starbox" do
      get :new, {}, valid_session
      assigns(:starbox).should be_a_new(Starbox)
    end
  end

  describe "GET edit" do
    it "assigns the requested starbox as @starbox" do
      starbox = Starbox.create! valid_attributes
      get :edit, {:id => starbox.to_param}, valid_session
      assigns(:starbox).should eq(starbox)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Starbox" do
        expect {
          post :create, {:starbox => valid_attributes}, valid_session
        }.to change(Starbox, :count).by(1)
      end

      it "assigns a newly created starbox as @starbox" do
        post :create, {:starbox => valid_attributes}, valid_session
        assigns(:starbox).should be_a(Starbox)
        assigns(:starbox).should be_persisted
      end

      it "redirects to the created starbox" do
        post :create, {:starbox => valid_attributes}, valid_session
        response.should redirect_to(Starbox.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved starbox as @starbox" do
        # Trigger the behavior that occurs when invalid params are submitted
        Starbox.any_instance.stub(:save).and_return(false)
        post :create, {:starbox => {  }}, valid_session
        assigns(:starbox).should be_a_new(Starbox)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Starbox.any_instance.stub(:save).and_return(false)
        post :create, {:starbox => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested starbox" do
        starbox = Starbox.create! valid_attributes
        # Assuming there are no other starboxes in the database, this
        # specifies that the Starbox created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Starbox.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => starbox.to_param, :starbox => { "these" => "params" }}, valid_session
      end

      it "assigns the requested starbox as @starbox" do
        starbox = Starbox.create! valid_attributes
        put :update, {:id => starbox.to_param, :starbox => valid_attributes}, valid_session
        assigns(:starbox).should eq(starbox)
      end

      it "redirects to the starbox" do
        starbox = Starbox.create! valid_attributes
        put :update, {:id => starbox.to_param, :starbox => valid_attributes}, valid_session
        response.should redirect_to(starbox)
      end
    end

    describe "with invalid params" do
      it "assigns the starbox as @starbox" do
        starbox = Starbox.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Starbox.any_instance.stub(:save).and_return(false)
        put :update, {:id => starbox.to_param, :starbox => {  }}, valid_session
        assigns(:starbox).should eq(starbox)
      end

      it "re-renders the 'edit' template" do
        starbox = Starbox.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Starbox.any_instance.stub(:save).and_return(false)
        put :update, {:id => starbox.to_param, :starbox => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested starbox" do
      starbox = Starbox.create! valid_attributes
      expect {
        delete :destroy, {:id => starbox.to_param}, valid_session
      }.to change(Starbox, :count).by(-1)
    end

    it "redirects to the starboxes list" do
      starbox = Starbox.create! valid_attributes
      delete :destroy, {:id => starbox.to_param}, valid_session
      response.should redirect_to(starboxes_url)
    end
  end

end