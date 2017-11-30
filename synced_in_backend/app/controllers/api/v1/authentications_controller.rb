class Api::V1::AuthenticationsController < ApplicationController

  @@secret = "whatASecretThisIs"

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = JWT.encode( {id: @user.id}, @@secret )
      render json: { jwt: token }
    else
      render json: {errors: ["No matches found... please try again"]}
    end
  end

  def finduser
    token = request.headers["Authorization"].split(" ")[1]
    decoded = JWT.decode(token, @@secret)
    user_id = decoded[0]["id"]
    @user = User.find_by(id: user_id)
    if @user
      render json: @user
    else
      render json: {errors: ["Invalid token... try to login again"]}
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
