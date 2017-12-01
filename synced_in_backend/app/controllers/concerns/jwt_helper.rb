module JwtHelper

    @@secret = "whatASecretThisIs"

    def new_token
      JWT.encode( {id: @user.id}, @@secret )
    end

    def decode_token
      JWT.decode(@token, @@secret)
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
