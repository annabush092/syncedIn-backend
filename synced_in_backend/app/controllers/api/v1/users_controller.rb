class Api::V1::UsersController < ApplicationController

  include JwtHelper

  def index
    @users = User.all
    render json: @users
  end

  def show
    find_user
    render json: @user
  end

  def create
    @user = User.new(username: params[:username], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
    if @user.save
      token = new_token
      render json: {jwt: token}
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  # def update
  #   find_user
  #   if params[:follow_id]
  #     @assoc = UserFollow.new(following_id: @user.id, followed_id: params[:follow_id])
  #   elsif params[:unfollow_id]
  #
  #   end
  #   if @assoc.save
  #     render json: @user
  #   else
  #     render json: {errors: @assoc.errors.full_messages}
  #   end
  # end

  # def destroy
  # end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

end
