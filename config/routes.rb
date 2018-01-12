Rails.application.routes.draw do
  resources :skills
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'subjects#index'
  
  resources :subjects do
    resources :sections, only: [:new, :create, :edit, :update]
  end

  resources :sections, only: [:show, :destroy]

end
