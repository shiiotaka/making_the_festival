Rails.application.routes.draw do
  root 'static_pages#home' # rootディレクトリ

  resources :users, only: %i[index new create]
end
