class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    find_user
    render json: @user
  end
  #
  # def create
  # end
  #
  def update
    find_user
    if params[:follow_id]
      @user.following << User.find_by(id: params[:follow_id])
    end
    if @user.save
      render json: @user
    else
      render json: {errors: ["Error updating user... please try again."]}
    end
  end

  # def destroy
  # end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

end
