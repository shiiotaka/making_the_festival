class UserSessionsController < ApplicationController

  # GET /login Prefix => login
  def new; end

  # POST /login Prefix => login
  def create
    # ログイン時に受け取ったメールアドレスとパスワードを変数@userに代入
    @user = login(params[:email], params[:password])

    # @userがtrue(存在する)の時、users_pathにリダイレクト
    # false(存在しない)の時、newアクションを発火
    if @user
      # redirect_back_or_toメソッドは保存されたURLがある場合、そのURLに。ない場合は指定されたURLにリダイレクトする
      redirect_back_or_to(:users, notice: 'ログインに成功しました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  # DELETE /logout Prefix => logout
  def destroy
    logout
    redirect_to(:users, norice: 'ログアウトしました')
  end
end
