module JwtHelper

  @@secret = "whatASecretThisIs"

  def new_token
    JWT.encode( {id: @user.id}, @@secret )
  end

  def decode_token
    begin
      decoded_token = JWT.decode(@token, @@secret)
    rescue JWT::VerificationError
      decoded_token = [ {"id" => 0} ]
    end
    decoded_token
  end

  def get_token
    request.headers["Authorization"].split(" ")[1]
  end

  def decode_user_id
    @token = get_token
    decoded = decode_token
    decoded[0]["id"]
  end

end
