Rails.application.routes.draw do
  get 'search/search'
  get 'reviews/create'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'registration', sign_out: 'logout'}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'}
  root 'static_pages#home'
  get 'static_pages/map'
  get '/your_trips', to:'reservations#your_trips'
  get '/your_reservations', to:'reservations#your_reservations'
  get 'search', to:'search#search'
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
  resources :reviews, only: [:create, :destroy]
end