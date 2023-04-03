class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
