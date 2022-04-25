Rails.application.routes.draw do
  root to: "time_sheets#index" 
  resources :time_sheets
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
