class StarboxesController < ApplicationController
  before_action :set_starbox, only: [:show, :edit, :update, :destroy]

  # GET /starboxes
  # GET /starboxes.json
  def index
    @starboxes = Starbox.all
  end

  # GET /starboxes/1
  # GET /starboxes/1.json
  def show
  end

  # GET /starboxes/new
  def new
    @starbox = Starbox.new
  end

  # GET /starboxes/1/edit
  def edit
  end

  # POST /starboxes
  # POST /starboxes.json
  def create
    @starbox = Starbox.new(starbox_params)

    respond_to do |format|
      if @starbox.save
        format.html { redirect_to @starbox, notice: 'Starbox was successfully created.' }
        format.json { render action: 'show', status: :created, location: @starbox }
      else
        format.html { render action: 'new' }
        format.json { render json: @starbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starboxes/1
  # PATCH/PUT /starboxes/1.json
  def update
    respond_to do |format|
      if @starbox.update(starbox_params)
        format.html { redirect_to @starbox, notice: 'Starbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @starbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starboxes/1
  # DELETE /starboxes/1.json
  def destroy
    @starbox.destroy
    respond_to do |format|
      format.html { redirect_to starboxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starbox
      @starbox = Starbox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def starbox_params
      params[:starbox]
    end
end
