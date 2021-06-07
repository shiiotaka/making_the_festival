class ApplicationController < ActionController::Base

  # フラッシュメッセージのキーを使用
  add_flash_types :success, :info, :warning, :danger
end
