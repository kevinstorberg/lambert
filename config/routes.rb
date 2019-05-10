Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  authenticated :user do
    root to: "users#show"
  end

  root to: 'public_pages#home'

  get '/about',   to: 'public_pages#about',   as: 'about'
  get '/contact', to: 'public_pages#contact', as: 'contact'
  get '/team',    to: 'public_pages#team',    as: 'team'

  resources :public_pages, only: [:edit, :index, :update]

  resources :service_areas

  resources :users do
    get :edit_password
    patch :update_password
  end
end
