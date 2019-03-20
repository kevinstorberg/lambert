Rails.application.routes.draw do

  root to: 'static_pages#home'

  authenticated :user do
    root to: "users#show"
  end
end
