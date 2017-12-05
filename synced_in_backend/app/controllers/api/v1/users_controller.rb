class Api::V1::UsersController < ApplicationController

  include JwtHelper

  def index
    @users = User.all
    render json: @users
  end

  # def show
  #   find_user
  #   render json: @user
  # end

  def create
    @user = User.new(username: params[:username], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], instrument_ids: params[:instrument_ids])
    if params[:new_instrument].length > 0
      @instrument = Instrument.find_or_create_by(name: params[:new_instrument], family_id: params[:new_instrument_fam])
      @user.instruments << @instrument
    end
    if @user.save
      token = new_token
      render json: {jwt: token}
    else
      render json: {errors: @user.errors.full_messages.concat(@instrument.errors.full_messages)}
    end
  end

  def update
    find_user
    @user.assign_attributes(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], instrument_ids: params[:instrument_ids])
    if params[:new_instrument].length > 0
      @instrument = Instrument.find_or_create_by(name: params[:new_instrument], family_id: params[:new_instrument_fam])
      @user.instruments << @instrument
    end
    auth_user = User.find_by(id: decode_user_id)
    if @user != auth_user
      render json: {errors: ["Invalid token. You must be logged in to edit your profile."]}
    elsif @user.save
      render json: @user
    else
      render json: {errors: @user.errors.full_messages.concat(@instrument.errors.full_messages)}
    end
  end

  # def destroy
  # end

  private
  def find_user
    @user = User.find_by(id: params[:id])
  end

end
