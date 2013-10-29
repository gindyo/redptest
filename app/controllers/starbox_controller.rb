class StarboxController < ApplicationController
  before_filter :set_starbox, only: [:front_face, :make]
  def front_face
  end

  def back_face
    
  end

  def make
      @starbox.make(params[:beverage])
      render json: @starbox.status
  end


  private
    def set_starbox
      @starbox = Starbox.new
    end
    def starbox_params
      params[:starbox]
    end
end
