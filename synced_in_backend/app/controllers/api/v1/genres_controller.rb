class Api::V1::GenresController < ApplicationController

  def index
    @genres = Genre.all
    render json: @genres
  end
  #
  # def show
  #   find_genre
  #   render json: @genre
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
  # def find_genre
  #   @genre = Genre.find_by(id: params[:id])
  # end

end
