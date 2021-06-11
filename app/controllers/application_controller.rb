class ApplicationController < ActionController::Base
  # ログインしていないユーザーを弾く。
  # current_userでないリクエストをセッションに格納し、not_authenticatedを実行する
  before_action :require_login

  # フラッシュメッセージのキーを使用
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to login_path
  end
end
