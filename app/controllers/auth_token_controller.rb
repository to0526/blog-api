class AuthTokenController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: { token: user.token }
    else
      head 204
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
