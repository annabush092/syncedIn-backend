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

  def update
    find_user
    
    if @user.save
      render json: @user
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  # def destroy
  # end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

end
