class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private

  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
