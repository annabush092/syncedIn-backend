class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags
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
