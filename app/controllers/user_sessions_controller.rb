class UserSessionsController < ApplicationController

  # POST /user_sessions Prefix => user_sessions
  def create
    @user = login(params[:email], params[:password])

    if @user
      # redirect_back_or_toメソッドは保存されたURLがある場合、そのURLに。ない場合は指定されたURLにリダイレクトする
      redirect_back_or_to(:users, notice: 'ログインに成功しました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  # DELETE /user_sessions/:id Prefix => user_session
  def destroy
    logout
    redirect_to(:users, norice: 'ログアウトしました')
  end
end
