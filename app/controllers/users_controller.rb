class UsersController < ApplicationController

  def index
  end

  # GET /users/new Prefix => new_user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # @userのデータ保存に成功するとき、login_pathにリダイレクトする
    # falseの場合、newアクションにrenderする
    if @user.save
      redirect_to login_path, notice: 'ユーザー登録が完了しました'
    else
      render :new
    end
  end

  private

  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
