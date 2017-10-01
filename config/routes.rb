Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, :id => /.*/

  get '/login', to: 'registration#show_login', as: :show_login
  post '/login', to: 'registration#login', as: :login
  get '/logout', to: 'registration#logout', as: :logout

  get '/safe-login', to: 'registration#show_safe_login', as: :show_safe_login
  post '/safe-login', to: 'registration#safe_login', as: :safe_login
  get '/reset-data', to: 'reset#reset', as: :reset_data
end
