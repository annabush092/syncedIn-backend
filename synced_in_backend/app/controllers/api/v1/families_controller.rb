class Api::V1::FamiliesController < ApplicationController

  def index
    @families = Family.all
    render json: @families
  end
  #
  # def show
  #   find_family
  #   render json: @family
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
  # def find_family
  #   @family = Family.find_by(id: params[:id])
  # end

end
