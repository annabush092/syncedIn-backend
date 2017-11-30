class Api::V1::AuthenticationsController < ApplicationController

  @@secret = "whatASecretThisIs"

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = JWT.encode( {id: @user.id}, @@secret )
      render json: { user: @user, jwt: token }
    else
      render json: {errors: ["No matches found... please try again"]}
    end
  end


  # def login
  #   @user = User.find_by(username: params[:username])
  #   if @user
  #     render json: @user
  #   else
  #     render json: {errors: ["No matches found... please try again"]}
  #   end
  # end

end
