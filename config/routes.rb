Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'subjects#index'
  
  resources :subjects do
    resources :sections, only: [:new, :create]
  end

  resources :sections

end
