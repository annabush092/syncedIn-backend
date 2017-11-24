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
  # def update
  # end
  #
  # def destroy
  # end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

end
