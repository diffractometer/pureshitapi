Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :attachments

  root :to => "application#hello"

  mount_devise_token_auth_for 'User', at: '/auth'
end
