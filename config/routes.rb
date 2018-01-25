Rails.application.routes.draw do
  resources :skills
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'subjects#index'
  
  resources :subjects do
      resources :sections, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :student_subjects, only: [:new, :create]
  

  resources :sections, only: [:show] do
    resources :standards, only:[:new]
  end

  resources :standards do 
    resources :student_standards, only:[:new, :create]
  end

end
