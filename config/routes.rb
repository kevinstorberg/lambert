Rails.application.routes.draw do

  devise_for :users
  root to: 'static_pages#home'

  authenticated :user do
    root to: "users#show"
  end
end
