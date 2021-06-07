Rails.application.routes.draw do
  root 'static_pages#home' # rootディレクトリ

  resources :users, only: %i[index new create]
  resources :user_sessions, only: %i[new create destroy]
end
