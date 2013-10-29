class InventoryProductsController < ApplicationController
  before_action :set_inventory_product, only: [:show, :edit, :update, :destroy]

  # GET /inventory_products
  # GET /inventory_products.json
  def index
    @inventory_products = InventoryProduct.all
  end

  # GET /inventory_products/1
  # GET /inventory_products/1.json
  def show
  end

  # GET /inventory_products/new
  def new
    @inventory_product = InventoryProduct.new
  end

  # GET /inventory_products/1/edit
  def edit
  end

  # POST /inventory_products
  # POST /inventory_products.json
  def create
    @inventory_product = InventoryProduct.new(inventory_product_params)

    respond_to do |format|
      if @inventory_product.save
        format.html { redirect_to @inventory_product, notice: 'Inventory product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inventory_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @inventory_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_products/1
  # PATCH/PUT /inventory_products/1.json
  def update
    respond_to do |format|
      if @inventory_product.update(inventory_product_params)
        format.html { redirect_to @inventory_product, notice: 'Inventory product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inventory_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_products/1
  # DELETE /inventory_products/1.json
  def destroy
    @inventory_product.destroy
    respond_to do |format|
      format.html { redirect_to inventory_products_url }
      format.json { head :no_content }
    end
  end

  def restock
    InventoryProduct.all.to_a.each do |i|
      i.available_count = 25
      i.save!
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_product
      @inventory_product = InventoryProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_product_params
      params.require(:inventory_product).permit(:name, :available_count, :unit_price)
    end
end
