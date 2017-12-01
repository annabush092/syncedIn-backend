module JwtHelper

    @@secret = "whatASecretThisIs"

    def new_token
      JWT.encode( {id: @user.id}, @@secret )
    end

    def decode_token
      JWT.decode(@token, @@secret)
    end

end
