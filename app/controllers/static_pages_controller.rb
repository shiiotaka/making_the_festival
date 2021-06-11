class StaticPagesController < ApplicationController

  # ログインしていなくてもアクセスできる
  skip_before_action :require_login, only: [:home]

  # GET /
  def home; end
end
