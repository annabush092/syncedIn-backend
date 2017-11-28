class Api::V1::PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
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
