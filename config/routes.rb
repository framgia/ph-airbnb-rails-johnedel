Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'registration', sign_out: 'logout'}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home'
end