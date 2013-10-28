class StarboxesController < ApplicationController
  def front_face
    @starbox = Starbox.new
  end

  def back_face
    
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
