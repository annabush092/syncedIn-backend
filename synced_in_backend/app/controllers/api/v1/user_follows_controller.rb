class Api::V1::UserFollowsController < ApplicationController

  def create
    @assoc = UserFollow.new(following_id: params[:following_id], followed_id: params[:followed_id])
    if @assoc.save
      @user = User.find_by(id: params[:followed_id])
      render json: @user
    else
      render json: {errors: @assoc.errors.full_messages}
    end
  end

  def delete_follow
    @assoc = UserFollow.find_by(following_id: params[:following_id], followed_id: params[:followed_id])
    @assoc.destroy
    @user = User.find_by(id: params[:followed_id])
    render json: @user
  end

end
