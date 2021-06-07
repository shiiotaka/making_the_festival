Rails.application.routes.draw do
  root 'static_pages#home' # rootディレクトリ

  resources :users, only: %i[index new create]

  get    'login'  => 'user_sessions#new',     :as => :login
  post   'login'  => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
