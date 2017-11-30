module JwtHelper

    @@secret = "whatASecretThisIs"

    def new_token
      JWT.encode( {id: @user.id}, @@secret )
    end

end
