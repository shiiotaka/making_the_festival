class UsersController < ApplicationController
  # ログインしていなくてもアクセスできる
  skip_before_action :require_login, only: %i[new create]

  # GET /users/new Prefix => new_user
  def new
    @user = User.new
  end

  # POST /users Prefix => users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: "「#{@user.name}」さんのユーザー登録が完了しました。"
    else
      flash.now[:danger] = '残念失敗しました'
      render :new
    end
  end

  private

  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
