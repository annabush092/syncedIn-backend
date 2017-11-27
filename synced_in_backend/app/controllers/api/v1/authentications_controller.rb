class Api::V1::AuthenticationsController < ApplicationController

  def login
    @user = User.find_by(username: params[:username])
    if @user
      render json: @user
    else
      render json: {errors: ["No matches found... please try again"]}
    end
  end

end
