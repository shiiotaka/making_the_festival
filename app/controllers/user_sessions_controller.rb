class UserSessionsController < ApplicationController

  # ログインしていなくてもアクセスできる
  skip_before_action :require_login, only: [:new, :create]

  # GET /login Prefix => login
  def new; end

  # POST /login Prefix => login
  def create
    # ログイン時に受け取ったメールアドレスとパスワードを変数@userに代入
    @user = login(params[:email], params[:password])

    # @userがtrue(存在する)の時、users_pathにリダイレクト
    # false(存在しない)の時、app/views/user_sessions/new.html.erbファイルを返す
    if @user
      # redirect_back_or_toメソッドは保存されたURLがある場合、そのURLに。ない場合は指定されたURLにリダイレクトする
      flash[:success] = 'ログインに成功しました'
      redirect_back_or_to(:users)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  # DELETE /logout Prefix => logout
  def destroy
    logout
    flash[:success] = 'ログアウトしました'
    redirect_to(:root)
  end
end
