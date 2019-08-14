Rails.application.routes.draw do
  
  get 'rooms/listing'
  get 'rooms/price'
  get 'rooms/description'
  get 'rooms/photos'
  get 'rooms/amenities'
  get 'rooms/location'
  get 'users/show'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_up: 'registration', sign_out: 'logout'}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'}
  root 'static_pages#home'

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
  end
  
end