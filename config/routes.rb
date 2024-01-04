Rails.application.routes.draw do
  
  root "static_pages#top"

  resources :users, only: %i[new create]

  # Google認証
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  # ユーザー登録
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
