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
    @user = User.new(username: params[:username], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
    if params[:instrument_ids]
      @new_instruments = params[:instrument_ids].map do |t|
        @user.association(:instruments).add_to_target(Instrument.find_by(id: t))
      end
    end
    if params[:new_instrument]
      @instrument = Instrument.find_or_create_by(name: params[:new_instrument], family_id: params[:new_instrument_fam])
      @user.association(:instruments).add_to_target(@instrument)
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
    auth_user = User.find_by(id: decode_user_id)
    if @user != auth_user
      render json: {errors: ["Invalid token. You must be logged in to edit your profile."]}
    elsif @user.update(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], instrument_ids: params[:instrument_ids])
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
