class Api::V1::InstrumentsController < ApplicationController

  def index
    @instruments = Instrument.all
    render json: @instruments
  end
  #
  # def show
  #   find_instrument
  #   render json: @instrument
  # end
  #
  # def create
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end
  #
  # private
  # def find_instrument
  #   @instrument = Instrument.find_by(id: params[:id])
  # end

end
