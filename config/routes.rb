Rails.application.routes.draw do
  root 'static_pages#home' # rootディレクトリ

  resources :users, only: %i[new create index]
  resources :time_tables do
    resource :artists, only: %i[create destroy update], shallow: true
  end

  get    'login'  => 'user_sessions#new', :as => :login
  post   'login'  => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
