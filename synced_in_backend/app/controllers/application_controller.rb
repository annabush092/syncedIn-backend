class ApplicationController < ActionController::API

  rescue_from PG::ConnectionBad do |exception|
    render json: {errors: ["Error connecting to the server. Check that your Postgres server is running."]}
  end

end
