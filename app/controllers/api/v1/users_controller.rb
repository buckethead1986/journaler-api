class Api::V1::UsersController < ActionController::API
  def index
    @users = User.all
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

  def update
    @user = User.find_by(id: user_params[:id])
    @user.settings = user_params['settings']
    @user.save
    render json: @user.to_json
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :password, :settings)
  end
end
