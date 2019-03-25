Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  authenticated :user do
    root to: "users#show"
  end

  root to: 'static_pages#home'

  get '/contact_us', to: 'static_pages#contact_us', as: 'contact_us'
end
