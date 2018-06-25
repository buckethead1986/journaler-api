class Api::V1::UsersController < ActionController::API
  def index
    # Renders the json data with journals sorted by created_at attribute, in descending order.
    @users = User.all.includes(:journals).order('journals.created_at ASC')
    render json: @users.to_json(:include => :journals)
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user.to_json(:include => :journals)
  end

  def create
    @user = User.create(user_params)
    render json: @user.to_json
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
