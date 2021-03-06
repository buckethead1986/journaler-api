class ApplicationController < ActionController::API
  before_action :authorized

  def issue_token(payload)
    JWT.encode(payload, "supersecretcode")
  end

  def jwt_token
      request.headers['Authorization']
  end

  def current_user
      begin
        decoded_token = JWT.decode(jwt_token, "supersecretcode")

      rescue JWT::DecodeError
        return nil
      end

      if decoded_token[0]["user_id"]
        @current_user ||= User.find(decoded_token[0]["user_id"])
      else

    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {error: "Not welcome" }, status: 401 unless logged_in?
  end
end
