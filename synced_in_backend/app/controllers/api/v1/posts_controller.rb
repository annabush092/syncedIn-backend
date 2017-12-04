class Api::V1::PostsController < ApplicationController

  include JwtHelper

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
  def create
    auth_user_id = decode_user_id
    @post = Post.new(content: params[:content], user_id: auth_user_id)
    if params[:tags]
      @new_tags = params[:tags].map do |t|
        @post.association(:tags).add_to_target(Tag.find_or_create_by(tag_text: t))
      end
    end
    if @post.save
      render json: @post
    else
      render json: {errors: @post.errors.full_messages}
    end
  end
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
