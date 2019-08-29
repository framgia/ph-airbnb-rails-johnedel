Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'registration', sign_out: 'logout'}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'}
  root 'static_pages#home'
  get '/your_trips', to:'reservations#your_trips'
  get '/your_reservations', to:'reservations#your_reservations'
  resources :users
  resources :rooms do 
    member do
      get 'listing'
      get 'price'
      get 'description'
      get 'photos'
      get 'amenities'
      get 'location'
    end
    resources :reservations, only: [:create]
  end
  resources :photos
end