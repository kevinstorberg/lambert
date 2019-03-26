Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  authenticated :user do
    root to: "users#show"
  end

  root to: 'static_pages#home'

  get '/about',   to: 'static_pages#about',   as: 'about'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  get '/team',    to: 'static_pages#team',    as: 'team'
end
