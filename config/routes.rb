Rails.application.routes.draw do
  resources :articles
  resources :users
  post "sign_in", to: "auth_token#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
