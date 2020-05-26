Rails.application.routes.draw do
  root 'user#index'

  resources :users do 
    resources :lists
  end
end
