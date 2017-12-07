class Api::V1::AuthenticationsController < ApplicationController

  include JwtHelper

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = new_token
      render json: { jwt: token }
    else
      render json: {errors: ["No matches found... please try again"]}
    end
  end

  def index
    user_id = decode_user_id
    @user = User.find_by(id: user_id)
    if @user
      render json: @user
    else
      render json: {errors: ["Invalid token... try to login again"]}
    end
  end


end

# TEST 
