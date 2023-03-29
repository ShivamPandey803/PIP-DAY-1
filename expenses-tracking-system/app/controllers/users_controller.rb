class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.valid? && user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  
    def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        render json: { user_id: user.id }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:email, :password)
    end
end
